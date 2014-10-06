#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import os
import sys
import uuid

from PIL import Image
from django.conf import settings
from django.db import models
from django.db.models import signals
from django.utils.translation import ugettext_lazy as _
from sorl.thumbnail import ImageField

logger = logging.getLogger(__name__)

NOTICE = "notice"
PHOTOGALLERY = "photogallery"
VIDEO_LIBRARY = "video library"
PODCAST = "podcast"
EVENT = "event"

STATES = (
    ("AC", "AC"),
    ("AL", "AL"),
    ("AP", "AP"),
    ("AP", "AP"),
    ("BA", "BA"),
    ("CE", "CE"),
    ("DF", "DF"),
    ("GO", "GO"),
    ("ES", "ES"),
    ("MA", "MA"),
    ("MT", "MT"),
    ("MS", "MS"),
    ("MG", "MG"),
    ("PA", "PA"),
    ("PB", "PB"),
    ("PR", "PR"),
    ("PE", "PE"),
    ("PI", "PI"),
    ("RJ", "RJ"),
    ("RN", "RN"),
    ("RS", "RS"),
    ("RO", "RO"),
    ("RR", "RR"),
    ("SP", "SP"),
    ("SC", "SC"),
    ("SE", "SE"),
    ("TO", "TO"),
)

def validate_photo(value):
    if not (value.name.lower().endswith(".jpg") or value.name.lower().endswith(".jpeg") or value.name.lower().endswith(".png") \
        or value.name.lower().endswith(".bmp") or  value.name.lower().endswith(".gif")):
        raise ValidationError(u"Formato não suportado. Por favor, envie um arquivo no formato .jpg, .jpeg, .png, .bmp ou .gif")

def validate_video(value):
    if not (value.name.lower().endswith(".mp4") or value.name.lower().endswith(".webm") or value.name.lower().endswith(".ogg")):
        raise ValidationError(u"Formato não suportado. Por favor, envie um arquivo no formato .mp4, .webm ou .ogg.")

class SocialNetwork(models.Model):
    """
    Social network
    """
    FACEBOOK = "facebook"
    TWITTER = "twitter"
    INSTAGRAM = "instagram"
    GOOGLE = "googleplus"
    TYPES = (
        (FACEBOOK, "Facebook"),
        (TWITTER, "Twitter"),
        (INSTAGRAM, "Instagram"),
        (GOOGLE, "Google +"),
    )

    type = models.CharField(_("Type"), max_length=16, choices=TYPES, help_text=_("Social network type"))
    url = models.CharField(_("URL"), max_length=32, help_text=_("Social network url"))

    class Meta:
        verbose_name = _("Social network")
        verbose_name_plural = _("Social networks")

    def __unicode__(self):
        return u"%s contact" % (self.type.capitalize())

class Contact(models.Model):
    """
    Contact
    """
    EMAIL = "email"
    PHONE = "phone"
    SKYPE = "skype"
    TYPES = (
        (EMAIL, "E-mail"),
        (PHONE, "Phone number"),
        (SKYPE, "Skype id"),
    )

    type = models.CharField(_("Type"), max_length=16, choices=TYPES, help_text=_("Contact type"))
    value = models.CharField(_("Value"), max_length=32, help_text=_("Contact value"))

    class Meta:
        verbose_name = _("Contact")
        verbose_name_plural = _("Contacts")

    def __unicode__(self):
        return u"%s contact" % (self.type.capitalize())

class Address(models.Model):
    street = models.CharField(_("Street"), max_length=32, help_text=_("Address street"))
    number = models.CharField(_("Number"), max_length=8, help_text=_("Address number"))
    complement = models.CharField(_("Complement"), max_length=64, help_text=_("Address complement"))
    district = models.CharField(_("District"), max_length=32, help_text=_("Address district"))
    zip_code = models.IntegerField(_("Zip code"), max_length=8, help_text=_("Address zip code"))
    city = models.CharField(_("City"), max_length=32, help_text=_("Address city"))
    state = models.CharField(_("State"), max_length=2, choices=STATES, help_text=_("Address state"))

    class Meta:
        verbose_name = _("Address")
        verbose_name_plural = _("Addresses")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

class About(models.Model):
    body = models.TextField(_("Body"), max_length=5120, help_text=_("About body"))

    class Meta:
        verbose_name = _("About")
        verbose_name_plural = _("Abouts")

    def __unicode__(self):
        return "%s" % self.pk

class Role(models.Model):
    name = models.CharField(_("Role"), max_length=64, help_text=_("Role name"))

    class Meta:
        verbose_name = _("Role")
        verbose_name_plural = _("Roles")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

class Member(models.Model):
    name = models.CharField(_("Name"), max_length=64, help_text=_("Member name"))
    about = models.TextField(_("About"), max_length=256, blank=True, help_text=_("Member about"))
    email = models.EmailField(_("Email"), max_length=32, blank=True, help_text=_("Member email"))
    phone = models.CharField(_("Phone"), max_length=32, blank=True, help_text=_("Member phone"))
    role = models.ForeignKey(Role, verbose_name=_("Role"), help_text=_("Member role"))
    photo = ImageField(upload_to=settings.MEDIA_MEMBERS_ROOT, max_length=256, validators=[validate_photo], help_text=_("Member photo"))

    class Meta:
        verbose_name = _("Member")
        verbose_name_plural = _("Members")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

    def photo_tag(self):
        return "<img width='300' src='%s'>" % (self.photo.url)

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

class Discipline(models.Model):
    name = models.CharField(_("Discipline"), max_length=32, unique=True, help_text=_("Discipline name"))

    class Meta:
        verbose_name = _("Discipline")
        verbose_name_plural = _("Disciplines")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

class CurricularPractice(models.Model):
    name = models.CharField(_("Name"), max_length=32, help_text=_("Curricular practice name"))
    discipline = models.ForeignKey(Discipline, verbose_name=_("Discipline"), related_name="curricular_practices", help_text=_("Curricular practice discipline"))

    class Meta:
        verbose_name = _("Curricular practice")
        verbose_name_plural = _("Curricular practices")
        unique_together = ("name", "discipline")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

class Editorial(models.Model):
    name = models.CharField(_("Editorial"), max_length=32, unique=True, help_text=_("Editorial name"))

    class Meta:
        verbose_name = _("Editorial")
        verbose_name_plural = _("Editorials")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

    def get_amount(self):
        return len(Notice.objects.filter(editorial=self)) \
            + len(Photogallery.objects.filter(editorial=self)) \
            + len(VideoLibrary.objects.filter(editorial=self))

class Author(models.Model):
    name = models.CharField(_("Name"), max_length=64, help_text=_("Author name"))
    about = models.TextField(_("About"), max_length=256, blank=True, help_text=_("Author about"))
    email = models.EmailField(_("Email"), max_length=32, blank=True, help_text=_("Author email"))
    phone = models.CharField(_("Phone"), max_length=32, blank=True, help_text=_("Author phone"))
    photo = ImageField(upload_to=settings.MEDIA_AUTHORS_ROOT, max_length=256, blank=True, validators=[validate_photo], help_text=_("Author photo"))

    class Meta:
        verbose_name = _("Author")
        verbose_name_plural = _("Authors")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

    def photo_tag(self):
        return "<img width='300' src='%s'>" % (self.photo.url)

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

class Photographer(models.Model):
    name = models.CharField(_("Name"), max_length=64, help_text=_("Photographer name"))
    about = models.TextField(_("About"), max_length=256, blank=True, help_text=_("Photographer about"))
    email = models.EmailField(_("Email"), max_length=32, blank=True, help_text=_("Photographer email"))
    phone = models.CharField(_("Phone"), max_length=32, blank=True, help_text=_("Photographer phone"))
    photo = ImageField(upload_to=settings.MEDIA_PHOTOGRAPHERS_ROOT, max_length=256, blank=True, validators=[validate_photo], help_text=_("Photographer photo"))

    class Meta:
        verbose_name = _("Photographer")
        verbose_name_plural = _("Photographers")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

    def photo_tag(self):
        return "<img width='300' src='%s'>" % (self.photo.url)

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

class Post(models.Model):
    TYPES = (
        (NOTICE, "Notice"),
        (PHOTOGALLERY, "Photogallery"),
        (VIDEO_LIBRARY, "Video Library"),
        (PODCAST, "Podcast"),
    )
    type = models.CharField(max_length=16, choices=TYPES)
    views = models.IntegerField(max_length=32, default=0)
    comments = models.IntegerField(max_length=32, default=0)
    likes = models.IntegerField(max_length=32, default=0)
    active = models.BooleanField(_("Active"), default=True, help_text=_("Is this active?"))
    featured = models.BooleanField(_("Featured"), default=True, help_text=_("Is this in featured session?"))
    date = models.DateField(_("Date"), help_text=_("Date"))
    date_modified = models.DateTimeField(_("Last modified"), auto_now=True)
    title = models.CharField(_("Title"), max_length=64, help_text=_("Title"))
    subtitle = models.CharField(_("Subtitle"), max_length=128, blank=True, help_text=_("Subtitle"))
    body = models.TextField(_("Body"), max_length=10240, help_text=_("Body"))

    class Meta:
        abstract = True

class Notice(Post):
    author = models.ForeignKey(Author, verbose_name=_("Author"), help_text=_("Notice author"))
    editorial = models.ForeignKey(Editorial, verbose_name=_("Editorial"), help_text=_("Notice editorial"))
    discipline = models.ForeignKey(Discipline, verbose_name=_("Discipline"), null=True, blank=True, help_text=_("Notice discipline"))
    curricular_practice = models.ForeignKey(CurricularPractice, verbose_name=_("Curricular practice"), null=True, blank=True, help_text=_("Notice curricular practice"))
    photo = ImageField(upload_to=settings.MEDIA_NEWS_ROOT, verbose_name=_("Photo"), max_length=256, validators=[validate_photo], help_text=_("Notice photo"))
    photographer = models.ForeignKey(Photographer, verbose_name=_("Photographer"), help_text=_("Notice photographer"))

    class Meta:
        verbose_name = _("Notice")
        verbose_name_plural = _("Notices")

    def __unicode__(self):
        return "%s" % (self.title.title())

    def save(self, *args, **kwargs):
        self.type = NOTICE
        super(Notice, self).save(*args, **kwargs)

    def photo_tag(self):
        return "<img width='300' src='%s'>" % (self.photo.url)

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

class Photogallery(Post):
    editorial = models.ForeignKey(Editorial, verbose_name=_("Editorial"), help_text=_("Photogallery editorial"))
    discipline = models.ForeignKey(Discipline, verbose_name=_("Discipline"), null=True, blank=True, help_text=_("Photogallery discipline"))
    curricular_practice = models.ForeignKey(CurricularPractice, verbose_name=_("Curricular practice"), null=True, blank=True, help_text=_("Photogallery curricular practice"))

    class Meta:
        verbose_name = _("Photogallery")
        verbose_name_plural = _("Photogalleries")

    def __unicode__(self):
        return "%s" % (self.title.capitalize())

    def save(self, *args, **kwargs):
        self.type = PHOTOGALLERY
        super(Photogallery, self).save(*args, **kwargs)

    def get_photos(self):
        return Photo.objects.filter(photogallery=self)

    def get_photo(self):
        return Photo.objects.filter(photogallery=self).order_by('?')[0].photo

    def get_amount(self):
        return len(Photo.objects.filter(photogallery=self))

class Photo(models.Model):
    photogallery = models.ForeignKey(Photogallery, related_name="photos")
    title = models.CharField(_("Title"), max_length=128, help_text=_("Photo title"))
    photo = ImageField(upload_to=settings.MEDIA_PHOTOGALLERY_ROOT, max_length=256, validators=[validate_photo], help_text=_("Photo"))
    photographer = models.ForeignKey(Photographer, verbose_name=_("Photographer"), help_text=_("Notice photographer"), related_name="photo_photographer")

    class Meta:
        verbose_name = _("Photo")
        verbose_name_plural = _("Photos")

    def __unicode__(self):
        return "%s" % (self.pk)


    def photo_tag(self):
        return "<img width='300' src='%s'>" % (self.photo.url)

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

class VideoLibrary(Post):
    editorial = models.ForeignKey(Editorial, verbose_name=_("Editorial"), help_text=_("Video library editorial"))
    discipline = models.ForeignKey(Discipline, verbose_name=_("Discipline"), null=True, blank=True, help_text=_("Video library discipline"))
    curricular_practice = models.ForeignKey(CurricularPractice, verbose_name=_("Curricular practice"), null=True, blank=True, help_text=_("Video library curricular practice"))

    class Meta:
        verbose_name = _("Video library")
        verbose_name_plural = _("Video libraries")

    def __unicode__(self):
        return "%s" % (self.title.capitalize())

    def save(self, *args, **kwargs):
        self.type = VIDEO_LIBRARY
        super(VideoLibrary, self).save(*args, **kwargs)

    def get_videos(self):
        return Video.objects.filter(video_library=self)

    def is_videoteca(self):
        return len(Video.objects.filter(video_library=self)) > 1

    def get_amount(self):
        return len(Video.objects.filter(video_library=self))

class Video(models.Model):
    video_library = models.ForeignKey(VideoLibrary, related_name="videos")
    youtube = models.CharField(_("Youtube code"), max_length=32, blank=True, help_text=_("Ex: umMIcZODm2k of http://www.youtube.com/embed/umMIcZODm2k"))
    vimeo = models.CharField(_("Vimeo code"), max_length=32, blank=True, help_text=_("Ex: 85228844 of http://player.vimeo.com/video/85228844"))

    class Meta:
        verbose_name = _("Video")
        verbose_name_plural = _("Videos")

    def __unicode__(self):
        return "%s" % (self.pk)

    def video(self):
        result = None

        if self.youtube:
            result = u"<iframe class=\"youtube-player\" src=\"http://www.youtube.com/embed/%s?showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>" % self.youtube
        elif self.vimeo:
            result = u"<iframe class=\"vimeo-player\" src=\"//player.vimeo.com/video/%s?badge=0&amp;byline=0&amp;portrait=0&amp;title=0\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>" % self.vimeo
        else:
            result = u"Vídeo inválido"

        return result

class Podcast(Post):
    download_url = models.URLField(_("Download URL"), max_length=128, blank=True, help_text=_("Podcast download url"))

    type = PODCAST

    class Meta:
        verbose_name = _("Podcast")
        verbose_name_plural = _("Podcasts")

    def __unicode__(self):
        return "%s" % (self.title.capitalize())

    def save(self, *args, **kwargs):
        self.type = PODCAST
        super(Podcast, self).save(*args, **kwargs)

class Event(Post):
    notices = models.ManyToManyField(Notice, verbose_name=_("Notice"), blank=True, help_text=_("Event notices"))
    photogalleries = models.ManyToManyField(Photogallery, verbose_name=_("Photogalleries"), blank=True, help_text=_("Event photogalleries"))
    video_libraries = models.ManyToManyField(VideoLibrary, verbose_name=_("Video libraries"), blank=True, help_text=_("Event video libraries"))
    podcasts = models.ManyToManyField(Podcast, verbose_name=_("Podcasts"), blank=True, help_text=_("Event podcasts"))

    class Meta:
        verbose_name = _("Event")
        verbose_name_plural = _("Events")

    def __unicode__(self):
        return "%s" % (self.title.capitalize())

    def save(self, *args, **kwargs):
        self.type = EVENT
        super(Event, self).save(*args, **kwargs)

    def all_videos(self):
        return [video_library.get_videos() for video_library in self.video_libraries.all()]


