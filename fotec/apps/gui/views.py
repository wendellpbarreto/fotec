#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render
from itertools import chain

from fotec.apps.core.views import GenericView
from fotec.apps.core.models import (
    New,
    Photogallery,
    VideoLibrary,
)

class FrontEnd(GenericView):
    def home(self, request):
        populars = New.objects.filter(active=True).order_by('?')[:5]
        recents = New.objects.filter(active=True).order_by('-date_modified')[:5]

        news = New.objects.filter(active=True).order_by('-date')[:5]
        photogalleries = Photogallery.objects.filter(active=True).order_by('-date')[:5]
        video_libraries = VideoLibrary.objects.filter(active=True).order_by('-date')[:5]
        # posts = New.objects.filter(active=True).order_by('-date')[:5]
        posts = list(chain(news, photogalleries, video_libraries))

        return {
            'template' : {
                'title' : 'fotec | início',
                'populars' : populars,
                'recents' : recents,
                'posts' : posts,
                'news' : news,
                'photogalleries' : photogalleries,
                'video_libraries' : video_libraries,
            }
        }

