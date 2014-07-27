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
from django.dispatch.dispatcher import receiver
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

def create_resized_photos(sender, instance):
    conf = {
        "thumbnail": {
            "w": 100, "h": 100
        },
        "small": {
            "w": 300, "h": 180
        },
        "medium": {
            "w": 570, "h": 320
        },
        "big": {
            "w": 1200, "h": 675
        },
    }
    default_color = (255, 255, 255, 1)
    photo_path = unicode(instance.photo.path)
    photo = Image.open(photo_path)
    extension = photo_path.rsplit(".", 1)[1]
    file_name = photo_path.rsplit("/", 1)[1].rsplit(".")[0]
    directory = photo_path.rsplit("/", 1)[0]

    if photo.mode not in ("L", "RGB"):
        photo = photo.convert("RGB")

    if extension not in ["jpg", "jpeg", "gif", "png"]:
        sys.exit()

    photo.thumbnail((conf["big"]["w"], conf["big"]["h"]), Image.ANTIALIAS)

    big = Image.new("RGBA", (conf["big"]["w"], conf["big"]["h"]), default_color)
    big.paste(photo, ((conf["big"]["w"] - photo.size[0]) / 2, (conf["big"]["h"] - photo.size[1]) / 2))
    big.save(os.path.join(directory, file_name + "-big.png"), "PNG", quality=100)

    photo.thumbnail((conf["medium"]["w"], conf["medium"]["h"]), Image.ANTIALIAS)

    medium = Image.new("RGBA", (conf["medium"]["w"], conf["medium"]["h"]), default_color)
    medium.paste(photo, ((conf["medium"]["w"] - photo.size[0]) / 2, (conf["medium"]["h"] - photo.size[1]) / 2))
    medium.save(os.path.join(directory, file_name + "-medium.png"), "PNG", quality=100)

    photo.thumbnail((conf["small"]["w"], conf["small"]["h"]), Image.ANTIALIAS)

    small = Image.new("RGBA", (conf["small"]["w"], conf["small"]["h"]), default_color)
    small.paste(photo, ((conf["small"]["w"] - photo.size[0]) / 2, (conf["small"]["h"] - photo.size[1]) / 2))
    small.save(os.path.join(directory, file_name + "-small.png"), "PNG", quality=100)

    # nw = 1080
    # nh = 1080
    # pw = photo.size[0]
    # ph = photo.size[1]
    # pr = float(pw) / float(ph)
    # nr = float(nw) / float(nh)

    # if pr > nr:
    #     # photo aspect is wider than destination ratio
    #     tw = int(round(nh * pr))
    #     photo = photo.resize((tw, nh), Image.ANTIALIAS)
    #     l = int(round(( tw - nw ) / 2.0))
    #     photo = photo.crop((l, 0, l + nw, nh))
    # elif pr < nr:
    #     # photo aspect is taller than destination ratio
    #     th = int(round(nw / pr))
    #     photo = photo.resize((nw, th), Image.ANTIALIAS)
    #     t = int(round(( th - nh ) / 2.0))
    #     photo = photo.crop((0, t, nw, t + nh))
    # else:
    #     # photo aspect matches the destination ratio
    #     photo = photo.resize(size, Image.ANTIALIAS)

    # photo.save(instance.photo.path, "PNG", quality=100)

def delete_photos(photo):
    photo_path = unicode(photo.path)
    filename = photo_path.rsplit("/", 1)[1].rsplit(".")[0]
    directory = photo_path.rsplit("/", 1)[0]

    try:
        os.remove(photo_path)
    except Exception, e:
        logger.warning(str(e))
    try:
        os.remove(os.path.join(directory, filename + "-big.png"))
    except Exception, e:
        logger.warning(str(e))
    try:
        os.remove(os.path.join(directory, filename + "-medium.png"))
    except Exception, e:
        logger.warning(str(e))
    try:
        os.remove(os.path.join(directory, filename + "-small.png"))
    except Exception, e:
        logger.warning(str(e))

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
    body = models.TextField(_("Body"), max_length=1024, help_text=_("About body"))

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
    about = models.TextField(_("About"), max_length=256, help_text=_("Member about"))
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
        return "<img src=\"%s\"/>" % (self.small())

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

class Discipline(models.Model):
    name = models.CharField(_("Discipline"), max_length=32, help_text=_("Discipline name"))

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

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

class Editorial(models.Model):
    name = models.CharField(_("Editorial"), max_length=32, help_text=_("Editorial name"))

    class Meta:
        verbose_name = _("Editorial")
        verbose_name_plural = _("Editorials")

    def __unicode__(self):
        return "%s" % (self.name.capitalize())

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
    active = models.BooleanField(_("Active"), default=True, help_text=_("Notice is active?"))
    featured = models.BooleanField(_("Featured"), default=True, help_text=_("Notice is in featured session?"))
    date = models.DateField(_("Date"), help_text=_("Notice date"))
    date_modified = models.DateTimeField(_("Last modified"), auto_now=True)
    title = models.CharField(_("Title"), max_length=64, help_text=_("Notice title"))
    subtitle = models.CharField(_("Subtitle"), max_length=128, blank=True, help_text=_("Notice subtitle"))
    body = models.TextField(_("Body"), max_length=1024, help_text=_("Notice body"))

    class Meta:
        abstract = True

class Notice(Post):
    editorial = models.ForeignKey(Editorial, verbose_name=_("Editorial"), help_text=_("Notice editorial"))
    discipline = models.ForeignKey(Discipline, verbose_name=_("Discipline"), null=True, blank=True, help_text=_("Notice discipline"))
    curricular_practice = models.ForeignKey(CurricularPractice, verbose_name=_("Curricular practice"), null=True, blank=True, help_text=_("Notice curricular practice"))

    def create_path(self, filename):
        try:
            folder_path = os.path.join(settings.MEDIA_NEWS_ROOT)
            hash_code = uuid.uuid4().hex
            photo_name = hash_code + ".png"

            try:
                photo_list = os.listdir(folder_path)
            except Exception, e:
                logger.error(str(e))
            else:
                while True:
                    if not (photo_name) in photo_list:
                        break

                    hash_code = uuid.uuid4().hex
                    photo_name = hash_code + ".png"
            finally:
                return os.path.join(folder_path, photo_name)
        except Exception, e:
            logger.error(str(e))

    photo = ImageField(upload_to=create_path, verbose_name=_("Photo"), max_length=256, validators=[validate_photo], help_text=_("Notice photo"))

    class Meta:
        verbose_name = _("Notice")
        verbose_name_plural = _("Notices")

    def __unicode__(self):
        return "%s" % (self.title.capitalize())

    def save(self, *args, **kwargs):
        self.type = NOTICE
        super(Notice, self).save(*args, **kwargs)

    def small(self):
        extension = self.photo.url.rsplit(".", 1)[1]
        photo_name = self.photo.url.rsplit("fotec", 1)[1]
        return photo_name.replace("." + extension, "-small.png")

    def medium(self):
        extension = self.photo.url.rsplit(".", 1)[1]
        photo_name = self.photo.url.rsplit("fotec", 1)[1]
        return photo_name.replace("." + extension, "-medium.png")

    def big(self):
        extension = self.photo.url.rsplit(".", 1)[1]
        photo_name = self.photo.url.rsplit("fotec", 1)[1]
        return photo_name.replace("." + extension, "-big.png")

    def photo_tag(self):
        return "<img src=\"%s\"/>" % (self.small())

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

@receiver(signals.pre_save, sender=Notice)
def notices_edit_decorator(sender, instance, **kwargs):
    try:
        photo = Notice.objects.get(pk=instance.pk).photo
    except Exception, e:
        logger.info(str(e))
    else:
        if photo != instance.photo:
            delete_photos(photo)

@receiver(signals.post_save, sender=Notice)
def notices_save_decorator(sender, instance, **kwargs):
    create_resized_photos(sender, instance)

@receiver(signals.pre_delete, sender=Notice)
def notices_delete_decorator(sender, instance, **kwargs):
    delete_photos(instance.photo)

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
    title = models.CharField(_("Title"), max_length=128, blank=True, help_text=_("Photo title"))
    credits = models.CharField(_("Credits"), max_length=64, blank=True, help_text=_("Photo credits"))

    def create_path(self, filename):
        try:
            folder_path = os.path.join(settings.MEDIA_PHOTOGALLERY_ROOT, unicode(self.photogallery.pk))
            hash_code = uuid.uuid4().hex
            photo_name = hash_code + ".png"

            try:
                photo_list = os.listdir(folder_path)
            except Exception, e:
                logger.error(str(e))
            else:
                while True:
                    if not (photo_name) in photo_list:
                        break

                    hash_code = uuid.uuid4().hex
                    photo_name = hash_code + ".png"
            finally:
                return os.path.join(folder_path, photo_name)
        except Exception, e:
            logger.error(str(e))

    photo = ImageField(upload_to=create_path, max_length=256, validators=[validate_photo], help_text=_("Photo"))

    class Meta:
        verbose_name = _("Photo")
        verbose_name_plural = _("Photos")

    def __unicode__(self):
        return "%s" % (self.pk)

    def small(self):
        extension = self.photo.url.rsplit(".", 1)[1]
        photo_name = self.photo.url.rsplit("fotec", 1)[1]
        return photo_name.replace("." + extension, "-small.png")

    def medium(self):
        extension = self.photo.url.rsplit(".", 1)[1]
        photo_name = self.photo.url.rsplit("fotec", 1)[1]
        return photo_name.replace("." + extension, "-medium.png")

    def big(self):
        extension = self.photo.url.rsplit(".", 1)[1]
        photo_name = self.photo.url.rsplit("fotec", 1)[1]
        return photo_name.replace("." + extension, "-big.png")

    def photo_tag(self):
        return "<img src=\"%s\"/>" % (self.small())

    photo_tag.short_description = _("Current photo")
    photo_tag.allow_tags = True

@receiver(signals.pre_save, sender=Photo)
def photo_edit_decorator(sender, instance, **kwargs):
    try:
        photo = Photo.objects.get(pk=instance.pk).photo
    except Exception, e:
        logger.info(str(e))
    else:
        if photo != instance.photo:
            delete_photos(photo)

@receiver(signals.post_save, sender=Photo)
def photo_save_decorator(sender, instance, **kwargs):
    create_resized_photos(sender, instance)

@receiver(signals.pre_delete, sender=Photo)
def photo_delete_decorator(sender, instance, **kwargs):
    delete_photos(instance.photo)

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

    def create_path(self, filename):
        try:
            folder_path = os.path.join(settings.MEDIA_VIDEO_LIBRARY_ROOT, unicode(self.video_library.pk))
            hash_code = uuid.uuid4().hex
            extension = filename.split(".")[1]
            video_name = hash_code + "." + extension

            try:
                video_list = os.listdir(folder_path)
            except Exception, e:
                logger.error(str(e))
            else:
                while True:
                    if not (video_name) in video_list:
                        break

                    hash_code = uuid.uuid4().hex
                    extension = filename.split(".")[1]
                    video_name = hash_code + "." + extension
            finally:
                return os.path.join(folder_path, video_name)
        except Exception, e:
            logger.error(str(e))

    file = models.FileField(upload_to=create_path, max_length=256, blank=True, validators=[validate_video], help_text=_("Video"))
    youtube = models.CharField(_("Youtube code"), max_length=32, blank=True, help_text=_("Ex: umMIcZODm2k of http://www.youtube.com/embed/umMIcZODm2k"))
    vimeo = models.CharField(_("Vimeo code"), max_length=32, blank=True, help_text=_("Ex: 85228844 of http://player.vimeo.com/video/85228844"))

    class Meta:
        verbose_name = _("Video")
        verbose_name_plural = _("Videos")

    def __unicode__(self):
        return "%s" % (self.pk)

    def video(self):
        result = None

        if self.file:
            file_name = self.file.url.rsplit("fotec", 1)[1]
            result = u"<iframe src=\"%s\">" % file_name
        elif self.youtube:
            result = u"<iframe class=\"youtube-player\" src=\"http://www.youtube.com/embed/%s?showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>" % self.youtube
        elif self.vimeo:
            result = u"<iframe class=\"vimeo-player\" src=\"//player.vimeo.com/video/%s?badge=0&amp;byline=0&amp;portrait=0&amp;title=0\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>" % self.vimeo

        return result

    video.allow_tags = True

    def image(self):
        result = None

        if self.file:
            file_name = self.file.url.rsplit("fotec", 1)[1]
            result = u"<iframe src=\"%s\">" % file_name
        elif self.youtube:
            result = u"<img src=\"http://img.youtube.com/vi/%s/0.jpg\">" % self.youtube
        elif self.vimeo:
            result = u"<iframe src=\"//player.vimeo.com/video/%s\"></iframe>" % self.vimeo

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


