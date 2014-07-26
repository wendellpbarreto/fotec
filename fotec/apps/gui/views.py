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
    Podcast,
    Event,
)

logger = logging.getLogger(__name__)

class GUI(GenericView):
    def home(self, request):
        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        notices = Notice.objects.filter(active=True).order_by('-date')[:5]
        photogalleries = Photogallery.objects.filter(active=True).order_by('-date')[:5]
        video_libraries = VideoLibrary.objects.filter(active=True).order_by('-date')[:5]
        podcasts = Podcast.objects.filter(active=True).order_by('-date')[:5]
        events = Event.objects.filter(active=True).order_by('-date')[:5]

        # posts = notices
        posts = list(chain(notices, photogalleries, video_libraries, podcasts, events))

            #         try:
            #     r = requests.get("https://graph.facebook.com/?ids=http://fotec.wendellpbarreto.com/")
            #     notice.comments = r.json()["http://fotec.wendellpbarreto.com/"]["comments"]
            # except Exception, e:
            #     logger.warning(str(e))
            #     notice.comments = 0

        return {
            'template' : {
                'title' : 'fotec | início',
                'populars' : populars,
                'recents' : recents,
                'commenteds' : commenteds,
                'posts' : posts,
                'notices' : notices,
                'photogalleries' : photogalleries,
                'video_libraries' : video_libraries,
            }
        }

    def notices(self, request):
        data = None

        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        notices = Notice.objects.filter(active=True).order_by('-date')[:5]

        data = {
            'template' : {
                'title' : 'fotec | notícias',
                'populars' : populars,
                'recents' : recents,
                'commenteds' : commenteds,
                'notices' : notices,
            }
        }

        return data

    def notice(self, request):
        data = None
        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

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
                    'commenteds' : commenteds,
                    'notice' : notice,
                }
            }
        finally:
            return data

    def photogalleries(self, request):
        data = None

        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        photogalleries = Photogallery.objects.filter(active=True).order_by('-date')[:5]

        data = {
            'template' : {
                'title' : 'fotec | fotogalerias',
                'populars' : populars,
                'recents' : recents,
                'commenteds' : commenteds,
                'photogalleries' : photogalleries,
            }
        }

        return data

    def photogallery(self, request):
        data = None

        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        try:
            pk = self.kwargs['pk']
            photogallery = Photogallery.objects.get(pk=pk)
            photogallery.views+=1
            photogallery.save()
        except Exception, e:
            logger.error(str(e))
        else:

            data =  {
                'template' : {
                    'title' : 'fotec | fotogaleria',
                    'url' : request.get_full_path(),
                    'populars' : populars,
                    'recents' : recents,
                    'commenteds' : commenteds,
                    'photogallery' : photogallery,
                }
            }
        finally:
            return data

    def video_libraries(self, request):
        data = None

        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        video_libraries = VideoLibrary.objects.filter(active=True).order_by('-date')[:5]

        data = {
            'template' : {
                'title' : 'fotec | videotecas',
                'populars' : populars,
                'recents' : recents,
                'commenteds' : commenteds,
                'video_libraries' : video_libraries,
            }
        }

        return data

    def video_library(self, request):
        data = None

        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        try:
            pk = self.kwargs['pk']
            video_library = VideoLibrary.objects.get(pk=pk)
            video_library.views+=1
            video_library.save()
        except Exception, e:
            logger.error(str(e))
        else:

            data =  {
                'template' : {
                    'title' : 'fotec | videoteca',
                    'url' : request.get_full_path(),
                    'populars' : populars,
                    'recents' : recents,
                    'commenteds' : commenteds,
                    'video_library' : video_library,
                }
            }
        finally:
            return data

    def events(self, request):
        data = None

        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        events = Event.objects.filter(active=True).order_by('-date')[:5]

        data = {
            'template' : {
                'title' : 'fotec | eventos',
                'populars' : populars,
                'recents' : recents,
                'commenteds' : commenteds,
                'events' : events,
            }
        }

        return data

    def event(self, request):
        data = None

        populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]

        try:
            pk = self.kwargs['pk']
            event = Event.objects.get(pk=pk)
            event.views+=1
            event.save()
        except Exception, e:
            logger.error(str(e))
        else:

            data =  {
                'template' : {
                    'title' : 'fotec | videoteca',
                    'url' : request.get_full_path(),
                    'populars' : populars,
                    'recents' : recents,
                    'commenteds' : commenteds,
                    'event' : event,
                }
            }
        finally:
            return data