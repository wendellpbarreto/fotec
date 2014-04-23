#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import requests

from django.shortcuts import render
from itertools import chain
from django.db.models import F

from fotec.apps.core.views import GenericView
from fotec.apps.core.models import (
    Notice,
    Photogallery,
    VideoLibrary,
)

logger = logging.getLogger(__name__)

class GUI(GenericView):
    def home(self, request):
        populars = Notice.objects.filter(active=True).order_by('-views')[:5]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:5]

        notices = Notice.objects.filter(active=True).order_by('-date')[:5]
        photogalleries = Photogallery.objects.filter(active=True).order_by('-date')[:5]
        video_libraries = VideoLibrary.objects.filter(active=True).order_by('-date')[:5]

        posts = notices
        # posts = list(chain(notices, photogalleries, video_libraries))

            #         try:
            #     r = requests.get("https://graph.facebook.com//?ids=http://fotec.wendellpbarreto.com/")
            #     notice.comments = r.json()["http://fotec.wendellpbarreto.com/"]["comments"]
            # except Exception, e:
            #     logger.warning(str(e))
            #     notice.comments = 0

        return {
            'template' : {
                'title' : 'fotec | início',
                'populars' : populars,
                'recents' : recents,
                'posts' : posts,
                'notices' : notices,
                'photogalleries' : photogalleries,
                'video_libraries' : video_libraries,
            }
        }

    def notice(self, request):
        data = None
        populars = Notice.objects.filter(active=True).order_by('?')[:5]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:5]

        try:
            pk = self.kwargs['pk']
            notice = Notice.objects.get(pk=pk)
            notice.views+=1
            notice.save()
        except Exception, e:
            logger.error(str(e))
        else:

            data =  {
                'template' : {
                    'title' : 'fotec | notícia',
                    'url' : request.get_full_path(),
                    'populars' : populars,
                    'recents' : recents,
                    'notice' : notice,
                }
            }
        finally:
            return data
