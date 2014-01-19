#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django import forms
from redactor.widgets import RedactorEditor
from .models import (
	News,
	Podcast,
)
	
class NewsAdminForm(forms.ModelForm):
    class Meta:
        model = News
        widgets = {
            'body': RedactorEditor(),
        }

class PodcastAdminForm(forms.ModelForm):
    class Meta:
        model = Podcast
        widgets = {
            'body': RedactorEditor(),
        }
