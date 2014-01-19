#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.contrib import admin
from django.contrib.auth.models import Group
from django.utils.translation import ugettext_lazy as _

from .models import *
from .forms import *

admin.site.unregister(Group)

class EditorialAdmin(admin.ModelAdmin):
	model = Editorial

admin.site.register(Editorial, EditorialAdmin)

class ImageInline(admin.StackedInline):
	model = Image
	extra = 1
	can_delete = True
	max_num = 8
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	readonly_fields = ('image_tag',)

class NewsAdmin(admin.ModelAdmin):
	inlines = (ImageInline,)
	model = News
	form = NewsAdminForm
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	fieldsets = (
		(
			_('Informations'), {
				'fields' : (
					('active', 'featured',),
					'date',
					'editorial',
					'title', 
					'subtitle', 
					'body',
				)
			}
		),
	)
	list_display = ('title', 'date', 'date_modified', 'editorial', 'featured', 'active',)
	list_filter = ('date', 'editorial__name', 'featured', 'active',)
	search_fields = ('date', 'date_modified', 'editorial__name', 'featured', 'active',)
	ordering = ('date_modified', 'date', 'editorial', 'active', 'featured')

admin.site.register(News, NewsAdmin)

class PodcastAdmin(admin.ModelAdmin):
	model = Podcast
	form = PodcastAdminForm
	classes = ('grp-collapse grp-open',)
	inline_classes = ('grp-collapse grp-open',)
	fieldsets = (
		(
			_('Informations'), {
				'fields' : (
					('active', 'date',),
					'download_url',
					'title', 
					'subtitle', 
					'body',
					'image',
				)
			}
		),
	)
	list_display = ('title', 'date', 'date_modified', 'active',)
	list_filter = ('date', 'active',)
	search_fields = ('date', 'date_modified', 'active',)
	ordering = ('date_modified', 'date', 'active',)
	readonly_fields = ('image_tag',)

admin.site.register(Podcast, PodcastAdmin)
