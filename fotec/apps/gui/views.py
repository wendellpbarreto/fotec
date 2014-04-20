#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from fotec.apps.core.views import GenericView
from fotec.apps.core.models import (
    New,
    Photogallery,
    VideoLibrary,
)

class FrontEnd(GenericView):
    def home(self, request):
        posts = New.objects.filter(active=True).order_by('-date')[:8]
        news = New.objects.filter(active=True).order_by('-date_modified')[:8]
        photogalleries = Photogallery.objects.filter(active=True).order_by('-date_modified')[:8]
        video_libraries = VideoLibrary.objects.filter(active=True).order_by('-date_modified')[:8]

        return {
            'template' : {
                'title' : 'fotec | início',
                'posts' : posts,
                'news' : news,
                'photogalleries' : photogalleries,
                'video_libraries' : video_libraries,
            }
        }

