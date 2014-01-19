#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

def validate_image(value):
	if not (value.name.lower().endswith('.jpg') or value.name.lower().endswith('.jpeg') or value.name.lower().endswith('.png') \
		or value.name.lower().endswith('.bmp') or  value.name.lower().endswith('.gif')):
		raise ValidationError(u'Formato não suportado. Por favor, envie um arquivo no formato .jpg, .jpeg, .png, .bmp ou .gif')	

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
	subtitle = models.CharField(_('Subtitle'), max_length=128, help_text=_('News subtitle'))
	body = models.TextField(_('Body'), max_length=1024, help_text=_('News body'))
	editorial = models.ForeignKey(Editorial, verbose_name=_('Editorial'), help_text=_('News editorial'))

	class Meta:
		verbose_name = _('News')
		verbose_name_plural = _('News')

	def __unicode__(self):
		return '%s' % (self.title.capitalize())

class Image(models.Model):
	news = models.ForeignKey(News)
	image = models.ImageField(upload_to=settings.MEDIA_NEWS_ROOT, max_length=256, validators=[validate_image], help_text='Image')		

	class Meta:
		verbose_name = _('Image')
		verbose_name_plural = _('Images')

	def __unicode__(self):
		return '%s' % (self.pk)

	def image_tag(self):
		return '<img src="%s"/>' % (self.image)

	image_tag.short_description = 'Image'
	image_tag.allow_tags = True

class Podcast(models.Model):
	active = models.BooleanField(_('Active'), default=True, help_text=_('Podcast is active?'))
	date = models.DateField(_('Date'), help_text=_('Podcast date'))
	date_modified = models.DateTimeField(_('Last modified'), auto_now=True)
	title = models.CharField(_('Title'), max_length=64, help_text=_('Podcast title'))
	subtitle = models.CharField(_('Subtitle'), max_length=128, help_text=_('Podcast subtitle'))
	body = models.TextField(_('Body'), max_length=1024, help_text=_('Podcast body'))
	download_url = models.URLField(_('Download URL'), max_length=128, help_text=_('Podcast download url'))
	image = models.ImageField(upload_to=settings.MEDIA_NEWS_ROOT, max_length=256, validators=[validate_image], help_text='Podcast image')		

	class Meta:
		verbose_name = _('Podcast')
		verbose_name_plural = _('Podcasts')

	def __unicode__(self):
		return '%s' % (self.title.capitalize())

	def image_tag(self):
		return '<img src="%s"/>' % (self.image)
		
	image_tag.short_description = 'Image'
	image_tag.allow_tags = True
