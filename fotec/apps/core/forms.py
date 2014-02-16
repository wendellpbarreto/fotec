#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django import forms
from redactor.widgets import RedactorEditor
from django.db import models

from .models import (
    Event,
	News,
    Podcast,
    Photogallery,
	VideoLibrary,
)

class EventAdminForm(forms.ModelForm):
    class Meta:
        model = Event
        formfield_overrides = {
            models.ManyToManyField: {'widget': forms.CheckboxSelectMultiple},
        }
        widgets = {
            'description': RedactorEditor(),
        }

class NewsAdminForm(forms.ModelForm):
    class Meta:
        model = News
        widgets = {
            'body': RedactorEditor(),
        }

class PhotogalleryAdminForm(forms.ModelForm):
    class Meta:
        model = Photogallery
        widgets = {
            'body': RedactorEditor(),
        }

class VideoLibraryAdminForm(forms.ModelForm):
    class Meta:
        model = VideoLibrary
        widgets = {
            'body': RedactorEditor(),
        }

class PodcastAdminForm(forms.ModelForm):
    class Meta:
        model = Podcast
        widgets = {
            'body': RedactorEditor(),
        }
