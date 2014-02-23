#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from fotec.apps.core.views import GenericView
from fotec.apps.core.models import (
	New,
	Podcast,	
)

class FrontEnd(GenericView):
	def home(self, request):
		news = New.objects.all().order_by('date_modified')
		podcasts = Podcast.objects.all().order_by('date_modified')

		return {
			'template' : {
				'title' : 'fotec | Início',
				'news' : news,
				'podcasts' : podcasts,
			}
		}

