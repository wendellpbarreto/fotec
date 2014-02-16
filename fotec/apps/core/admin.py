#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.contrib import admin
from django.contrib.auth.models import Group
from django.utils.translation import ugettext_lazy as _

from .models import *
from .forms import *

admin.site.unregister(Group)

class EventAdmin(admin.ModelAdmin):
	model = Event
	form = EventAdminForm
	fieldsets = (
		(
			_('Informations'), {
				'fields' : (
					('active', 'date',),
					'name', 
					'description', 
				)
			}
		),
		(
			_('Medias'), {
				'fields' : (
					'news', 
					'photogalleries', 
					'video_libraries',
				)
			}
		),
	)
	filter_horizontal = ('news', 'photogalleries', 'video_libraries',)


admin.site.register(Event, EventAdmin)

class EditorialAdmin(admin.ModelAdmin):
	model = Editorial

admin.site.register(Editorial, EditorialAdmin)

class NewsAdmin(admin.ModelAdmin):
	model = News
	form = NewsAdminForm
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	fieldsets = (
		(
			_('Informations'), {
				'fields' : (
					('date', 'active', 'featured'),
					'editorial',
				)
			}
		),
		(
			_('Description'), {
				'fields' : (
					'title', 
					'subtitle', 
					'body',
					'photo',
				)
			}
		),
	)
	list_display = ('title', 'date', 'date_modified', 'editorial', 'featured', 'active',)
	list_filter = ('date', 'editorial__name', 'featured', 'active',)
	search_fields = ('date', 'date_modified', 'editorial__name', 'featured', 'active',)
	ordering = ('date_modified', 'date', 'editorial', 'active', 'featured')
	readonly_fields = ('photo_tag',)

admin.site.register(News, NewsAdmin)

class PhotoInline(admin.StackedInline):
	model = Photo
	extra = 1
	can_delete = True
	max_num = 8
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	readonly_fields = ('photo_tag',)

class PhotogalleryAdmin(admin.ModelAdmin):
	model = Photogallery
	form = PhotogalleryAdminForm
	inlines = (PhotoInline,)
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	fieldsets = (
		(
			_('Informations'), {
				'fields' : (
					'date', 
					('active', 'featured',),
				)
			}
		),
		(
			_('Description'), {
				'fields' : (
					'title', 
					'subtitle', 
					'body',
				)
			}

		),
	)
	list_display = ('title', 'date', 'date_modified', 'active',)
	list_filter = ('date', 'active',)
	search_fields = ('date', 'date_modified', 'active',)
	ordering = ('date_modified', 'date', 'active',)

admin.site.register(Photogallery, PhotogalleryAdmin)

class VideoInline(admin.StackedInline):
	model = Video
	extra = 1
	can_delete = True
	max_num = 8
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)

class VideoLibraryAdmin(admin.ModelAdmin):
	model = VideoLibrary
	form = VideoLibraryAdminForm
	inlines = (VideoInline,)
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	fieldsets = (
		(
			_('Informations'), {
				'fields' : (
					'date', 
					('active', 'featured',),
				)
			}
		),
		(
			_('Description'), {
				'fields' : (
					'title', 
					'subtitle', 
					'body',
				)
			}
		),
	)
	list_display = ('title', 'date', 'date_modified', 'active',)
	list_filter = ('date', 'active',)
	search_fields = ('date', 'date_modified', 'active',)
	ordering = ('date_modified', 'date', 'active',)

admin.site.register(VideoLibrary, VideoLibraryAdmin)

class PodcastAdmin(admin.ModelAdmin):
	model = Podcast
	form = PodcastAdminForm
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	fieldsets = (
		(
			_('Informations'), {
				'fields' : (
					'date', 
					('active',),
				)
			}
		),
		(
			_('Description'), {
				'fields' : (
					'title', 
					'subtitle', 
					'body',
					'download_url',
				)
			}
		),
	)
	list_display = ('title', 'date', 'date_modified', 'active',)
	list_filter = ('date', 'active',)
	search_fields = ('date', 'date_modified', 'active',)
	ordering = ('date_modified', 'date', 'active',)

admin.site.register(Podcast, PodcastAdmin)
