#!/usr/bin/env python
# -*- coding: utf-8 -*-

import Image
import logging 
import os
import sys
import uuid

from django.conf import settings
from django.db import models
from django.db.models import signals
from django.dispatch.dispatcher import receiver
from django.utils.translation import ugettext_lazy as _
from sorl.thumbnail import ImageField

logger = logging.getLogger(__name__)

def validate_photo(value):
	if not (value.name.lower().endswith('.jpg') or value.name.lower().endswith('.jpeg') or value.name.lower().endswith('.png') \
		or value.name.lower().endswith('.bmp') or  value.name.lower().endswith('.gif')):
		raise ValidationError(u'Formato não suportado. Por favor, envie um arquivo no formato .jpg, .jpeg, .png, .bmp ou .gif')	

def create_resized_photos(sender, instance):
	conf = {
		'small': {
			'w': 300, 'h': 180
		}, 
		'medium': {
			'w': 570, 'h': 320
		}, 
		'big': {
			'w': 1200, 'h': 675
		},
	}
	default_color = (255, 255, 255, 0)
	photo_path = unicode(instance.photo.path)
	photo = Image.open(photo_path) 
	extension = photo_path.rsplit('.', 1)[1]
	file_name = photo_path.rsplit("/",1)[1].rsplit(".")[0]
	directory = photo_path.rsplit('/', 1)[0]
	
	if photo.mode not in ("L", "RGB"):
		photo = photo.convert("RGB")

	if extension not in ['jpg', 'jpeg', 'gif', 'png']: 
		sys.exit()
	
	photo.thumbnail((conf['big']['w'], conf['big']['h']), Image.ANTIALIAS)
	
	big = Image.new("RGBA", (conf['big']['w'], conf['big']['h']), default_color)
	big.paste(photo, ((conf['big']['w'] - photo.size[0]) / 2, (conf['big']['h'] - photo.size[1]) / 2))
	big.save(os.path.join(directory, file_name + "-big.png"), 'PNG', quality=100)
	
	photo.thumbnail((conf['medium']['w'], conf['medium']['h']), Image.ANTIALIAS)
	
	medium = Image.new("RGBA", (conf['medium']['w'], conf['medium']['h']), default_color)
	medium.paste(photo, ((conf['medium']['w'] - photo.size[0]) / 2, (conf['medium']['h'] - photo.size[1]) / 2))
	medium.save(os.path.join(directory, file_name + "-medium.png"), 'PNG', quality=100)
	
	photo.thumbnail((conf['small']['w'], conf['small']['h']), Image.ANTIALIAS)
	
	small = Image.new("RGBA", (conf['small']['w'], conf['small']['h']), default_color)
	small.paste(photo, ((conf['small']['w'] - photo.size[0]) / 2, (conf['small']['h'] - photo.size[1]) / 2))
	small.save(os.path.join(directory, file_name + "-small.png"), 'PNG', quality=100)

def validate_video(value):
	if not (value.name.lower().endswith('.mp4') or value.name.lower().endswith('.webm') or value.name.lower().endswith('.ogg')):
		raise ValidationError(u'Formato não suportado. Por favor, envie um arquivo no formato .mp4, .webm ou .ogg.')	

class Editorial(models.Model):
	name = models.CharField(_('Name'), max_length=32, help_text=_('Editorial name'))

	class Meta:
		verbose_name = _('Editorial')
		verbose_name_plural = _('Editorials')

	def __unicode__(self):
		return '%s' % (self.name.capitalize())
		
class News(models.Model):
	active = models.BooleanField(_('Active'), default=True, help_text=_('News is active?'))
	featured = models.BooleanField(_('Featured'), default=False, help_text=_('News is in featured session?'))
	date = models.DateField(_('Date'), help_text=_('News date'))
	date_modified = models.DateTimeField(_('Last modified'), auto_now=True)
	title = models.CharField(_('Title'), max_length=64, help_text=_('News title'))
	subtitle = models.CharField(_('Subtitle'), max_length=128, blank=True, help_text=_('News subtitle'))
	body = models.TextField(_('Body'), max_length=1024, help_text=_('News body'))
	editorial = models.ForeignKey(Editorial, verbose_name=_('Editorial'), help_text=_('News editorial'))
	
	def create_path(self, filename):
		try:
			folder_path = os.path.join(settings.MEDIA_NEWS_ROOT)
			hash_code = uuid.uuid4().hex 
			photo_name = hash_code + '.png'
			
			try:
				photo_list = os.listdir(folder_path)
			except Exception, e:
				logger.error(str(e))
			else:
				while True:
					if not (photo_name) in photo_list:
						break

					hash_code = uuid.uuid4().hex 
					photo_name = hash_code + '.png'
			finally:
				return os.path.join(folder_path, photo_name)
		except Exception, e:
			logger.error(str(e))

	photo = ImageField(upload_to=create_path, verbose_name=_('Photo'), max_length=256, validators=[validate_photo], help_text=_('News photo'))

	class Meta:
		verbose_name = _('News')
		verbose_name_plural = _('News')

	def __unicode__(self):
		return '%s' % (self.title.capitalize())
	
	def photo_tag(self):
		return '<img src="%s"/>' % (self.photo)

	photo_tag.short_description = 'Photo'
	photo_tag.allow_tags = True

@receiver(signals.post_save, sender=News)
def news_save_decorator(sender, instance, **kwargs):
	create_resized_photos(sender, instance)

class Photogallery(models.Model):
	active = models.BooleanField(_('Active'), default=True, help_text=_('Photogallery is active?'))
	featured = models.BooleanField(_('Featured'), default=False, help_text=_('Photogallery is in featured session?'))
	date = models.DateField(_('Date'), help_text=_('Photogallery date'))
	date_modified = models.DateTimeField(_('Last modified'), auto_now=True)
	title = models.CharField(_('Title'), max_length=64, help_text=_('Photogallery title'))
	subtitle = models.CharField(_('Subtitle'), max_length=128, blank=True, help_text=_('Photogallery subtitle'))
	body = models.TextField(_('Body'), max_length=1024, blank=True, help_text=_('Photogallery body'))

	class Meta:
		verbose_name = _('Photogallery')
		verbose_name_plural = _('Photogalleries')

	def __unicode__(self):
		return '%s' % (self.title.capitalize())

class Photo(models.Model):
	photogallery = models.ForeignKey(Photogallery)

	def create_path(self, filename):
		try:
			folder_path = os.path.join(settings.MEDIA_PHOTOGALLERY_ROOT, unicode(self.photogallery.pk))
			hash_code = uuid.uuid4().hex 
			photo_name = hash_code + '.png'
			
			try:
				photo_list = os.listdir(folder_path)
			except Exception, e:
				logger.error(str(e))
			else:
				while True:
					if not (photo_name) in photo_list:
						break

					hash_code = uuid.uuid4().hex 
					photo_name = hash_code + '.png'
			finally:
				return os.path.join(folder_path, photo_name)
		except Exception, e:
			logger.error(str(e))

	photo = ImageField(upload_to=create_path, max_length=256, validators=[validate_photo], help_text=_('Photo'))

	class Meta:
		verbose_name = _('Photo')
		verbose_name_plural = _('Photos')

	def __unicode__(self):
		return '%s' % (self.pk)

	def photo_tag(self):
		return '<img src="%s"/>' % (self.photo)

	photo_tag.short_description = 'Photo'
	photo_tag.allow_tags = True

	def small(self):
		extension = self.photo.url.rsplit('.', 1)[1]
		photo_name = self.photo.url.rsplit('fotec', 1)[1]
		return photo_name.replace('.' + extension, '-small.png')

	def medium(self):
		extension = self.photo.url.rsplit('.', 1)[1]
		photo_name = self.photo.url.rsplit('fotec', 1)[1]
		return photo_name.replace('.' + extension, '-medium.png')

	def big(self):
		extension = self.photo.url.rsplit('.', 1)[1]
		photo_name = self.photo.url.rsplit('fotec', 1)[1]
		return photo_name.replace('.' + extension, '-big.png')

@receiver(signals.post_save, sender=Photo)
def photo_save_decorator(sender, instance, **kwargs):
	create_resized_photos(sender, instance)

class VideoLibrary(models.Model):
	active = models.BooleanField(_('Active'), default=True, help_text=_('Video library is active?'))
	featured = models.BooleanField(_('Featured'), default=False, help_text=_('Video library is in featured session?'))
	date = models.DateField(_('Date'), help_text=_('Video library date'))
	date_modified = models.DateTimeField(_('Last modified'), auto_now=True)
	title = models.CharField(_('Title'), max_length=64, help_text=_('Video library title'))
	subtitle = models.CharField(_('Subtitle'), max_length=128, blank=True, help_text=_('Video library subtitle'))
	body = models.TextField(_('Body'), max_length=1024, blank=True, help_text=_('Video library body'))

	class Meta:
		verbose_name = _('Video library')
		verbose_name_plural = _('Video libraries')

	def __unicode__(self):
		return '%s' % (self.title.capitalize())

class Video(models.Model):
	video_library = models.ForeignKey(VideoLibrary)

	def create_path(self, filename):
		try:
			folder_path = os.path.join(settings.MEDIA_VIDEO_LIBRARY_ROOT, unicode(self.video_library.pk))
			hash_code = uuid.uuid4().hex 
			extension = filename.split('.')[1]
			video_name = hash_code + '.' + extension
			
			try:
				video_list = os.listdir(folder_path)
			except Exception, e:
				logger.error(str(e))
			else:
				while True:
					if not (video_name) in video_list:
						break

					hash_code = uuid.uuid4().hex 
					extension = filename.split('.')[1]
					video_name = hash_code + '.' + extension
			finally:
				return os.path.join(folder_path, video_name)
		except Exception, e:
			logger.error(str(e))

	video = models.FileField(upload_to=create_path, max_length=256, blank=True, validators=[validate_video], help_text=_('Video'))
	youtube = models.URLField(max_length=200, blank=True, help_text=_('Ex: //www.youtube.com/embed/umMIcZODm2k'))
	vimeo = models.URLField(max_length=200, blank=True, help_text=_('Ex: //player.vimeo.com/video/85228844'))

	class Meta:
		verbose_name = _('Video')
		verbose_name_plural = _('Videos')

	def __unicode__(self):
		return '%s' % (self.pk)	

class Podcast(models.Model):
	active = models.BooleanField(_('Active'), default=True, help_text=_('Podcast is active?'))
	date = models.DateField(_('Date'), help_text=_('Podcast date'))
	date_modified = models.DateTimeField(_('Last modified'), auto_now=True)
	title = models.CharField(_('Title'), max_length=64, help_text=_('Podcast title'))
	subtitle = models.CharField(_('Subtitle'), max_length=128, blank=True, help_text=_('Podcast subtitle'))
	body = models.TextField(_('Body'), max_length=1024, help_text=_('Podcast body'))
	download_url = models.URLField(_('Download URL'), max_length=128, blank=True, help_text=_('Podcast download url'))

	class Meta:
		verbose_name = _('Podcast')
		verbose_name_plural = _('Podcasts')

	def __unicode__(self):
		return '%s' % (self.title.capitalize())

class Event(models.Model):
	active = models.BooleanField(_('Active'), default=True, help_text=_('Event is active?'))
	name = models.CharField(_('Name'), max_length=32, help_text=_('Event name'))
	description = models.CharField(_('Description'), max_length=32, help_text=_('Event description'))
	date = models.DateField(_('Date'), help_text=_('Event date'))
	date_modified = models.DateTimeField(_('Last modified'), auto_now=True)
	news = models.ManyToManyField(News, verbose_name=_('News'), help_text=_('Event news'))
	photogalleries = models.ManyToManyField(Photogallery, verbose_name=_('Photogalleries'), help_text=_('Event photogalleries'))
	video_libraries = models.ManyToManyField(VideoLibrary, verbose_name=_('Video libraries'), help_text=_('Event video libraries'))

	class Meta:
		verbose_name = _('Event')
		verbose_name_plural = _('Events')

	def __unicode__(self):
		return '%s' % (self.name.capitalize())
