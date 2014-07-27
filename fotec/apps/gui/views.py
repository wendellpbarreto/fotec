#!/usr/bin/env python
# -*- coding: utf-8 -*-

import logging
import requests

from django.shortcuts import render
from itertools import chain
from django.db.models import F, Q

from fotec.apps.core.views import GenericView
from fotec.apps.core.models import (
    About,
    Member,
    SocialNetwork,
    Address,
    Contact,
    Discipline,
    CurricularPractice,
    Notice,
    Photogallery,
    VideoLibrary,
    Podcast,
    Event,
)

logger = logging.getLogger(__name__)

class GUI(GenericView):

    def __init__(self):
        self.disciplines = Discipline.objects.all()
        self.populars = Notice.objects.filter(active=True).order_by('-views')[:4]
        self.recents = Notice.objects.filter(active=True).order_by('-date_modified')[:4]
        self.commenteds = Notice.objects.filter(active=True).order_by('-comments')[:4]
        self.social_networks = SocialNetwork.objects.all()

    def home(self, request):
        notices = Notice.objects.filter(active=True).order_by('-date')[:5]
        photogalleries = Photogallery.objects.filter(active=True).order_by('-date')[:5]
        video_libraries = VideoLibrary.objects.filter(active=True).order_by('-date')[:5]
        podcasts = Podcast.objects.filter(active=True).order_by('-date')[:5]
        events = Event.objects.filter(active=True).order_by('-date')[:5]

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
                'disciplines' : self.disciplines,
                'populars' : self.populars,
                'recents' : self.recents,
                'commenteds' : self.commenteds,
                'social_networks' : self.social_networks,
                'posts' : posts,
                'notices' : notices,
                'photogalleries' : photogalleries,
                'video_libraries' : video_libraries,
            }
        }

    def about(self, request):
        abouts = About.objects.all()
        members = Member.objects.all().order_by('name')
        addresses = Address.objects.all()
        contacts = Contact.objects.all()

        return {
            'template' : {
                'title' : 'fotec | início',
                'disciplines' : self.disciplines,
                'populars' : self.populars,
                'recents' : self.recents,
                'commenteds' : self.commenteds,
                'social_networks' : self.social_networks,
                'abouts' : abouts,
                'members' : members,
                'addresses' : addresses,
                'contacts' : contacts,
            }
        }


    def posts(self, request):
        notices, photogalleries, video_libraries = None, None, None

        try:
            discipline = Discipline.objects.get(pk=request.GET['discipline'])
        except Exception, e:
            logger.error(str(e))
        else:
            try:
                notices = Notice.objects.filter(active=True, discipline=discipline).order_by('-date')
                photogalleries = Photogallery.objects.filter(active=True, discipline=discipline).order_by('-date')
                video_libraries = VideoLibrary.objects.filter(active=True, discipline=discipline).order_by('-date')
            except Exception, e:
                logger.error(str(e))

        try:
            curricular_practice = CurricularPractice.objects.get(pk=request.GET['curricular_practice'])
        except Exception, e:
            logger.error(str(e))
        else:
            if notices and photogalleries and video_libraries:
                notices = notices.filter(active=True, curricular_practice=curricular_practice).order_by('-date')
                photogalleries = photogalleries.filter(active=True, curricular_practice=curricular_practice).order_by('-date')
                video_libraries = video_libraries.filter(active=True, curricular_practice=curricular_practice).order_by('-date')
            else:
                notices = Notice.objects.filter(active=True, curricular_practice=curricular_practice).order_by('-date')
                photogalleries = Photogallery.objects.filter(active=True, curricular_practice=curricular_practice).order_by('-date')
                video_libraries = VideoLibrary.objects.filter(active=True, curricular_practice=curricular_practice).order_by('-date')

        try:
            keywords = request.GET['keywords'].split()
            print keywords
        except Exception, e:
            logger.error(str(e))
        else:
            if notices and photogalleries and video_libraries:
                notices = notices.filter(reduce(lambda x, y: x | y, [Q(title__icontains=unicode(keyword)) for keyword in keywords]))
                photogalleries = photogalleries.filter(reduce(lambda x, y: x | y, [Q(title__icontains=unicode(keyword)) for keyword in keywords]))
                video_libraries = video_libraries.filter(reduce(lambda x, y: x | y, [Q(title__icontains=unicode(keyword)) for keyword in keywords]))
            else:
                notices = Notice.objects.filter(reduce(lambda x, y: x | y, [Q(title__icontains=unicode(keyword)) for keyword in keywords]), active=True).order_by('-date')
                photogalleries = Photogallery.objects.filter(reduce(lambda x, y: x | y, [Q(title__icontains=unicode(keyword)) for keyword in keywords]), active=True).order_by('-date')
                video_libraries = VideoLibrary.objects.filter(reduce(lambda x, y: x | y, [Q(title__icontains=unicode(keyword)) for keyword in keywords]), active=True).order_by('-date')

        posts = list(chain(notices, photogalleries, video_libraries))

        return {
            'template' : {
                'title' : 'fotec | início',
                'disciplines' : self.disciplines,
                'populars' : self.populars,
                'recents' : self.recents,
                'commenteds' : self.commenteds,
                'social_networks' : self.social_networks,
                'posts' : posts
            }
        }

    def notices(self, request):
        data = None
        notices = Notice.objects.filter(active=True).order_by('-date')[:5]

        data = {
            'template' : {
                'title' : 'fotec | notícias',
                'disciplines' : self.disciplines,
                'populars' : self.populars,
                'recents' : self.recents,
                'commenteds' : self.commenteds,
                'social_networks' : self.social_networks,
                'notices' : notices,
            }
        }

        return data

    def notice(self, request):
        data = None

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
                    'disciplines' : self.disciplines,
                    'populars' : self.populars,
                    'recents' : self.recents,
                    'commenteds' : self.commenteds,
                    'social_networks' : self.social_networks,
                    'notice' : notice,
                }
            }
        finally:
            return data

    def photogalleries(self, request):
        data = None

        data = {
            'template' : {
                'title' : 'fotec | fotogalerias',
                'disciplines' : self.disciplines,
                'populars' : self.populars,
                'recents' : self.recents,
                'commenteds' : self.commenteds,
                'social_networks' : self.social_networks,
                'photogalleries' : photogalleries,
            }
        }

        return data

    def photogallery(self, request):
        data = None

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
                    'disciplines' : self.disciplines,
                    'populars' : self.populars,
                    'recents' : self.recents,
                    'commenteds' : self.commenteds,
                    'social_networks' : self.social_networks,
                    'photogallery' : photogallery,
                }
            }
        finally:
            return data

    def video_libraries(self, request):
        data = None
        video_libraries = VideoLibrary.objects.filter(active=True).order_by('-date')[:5]

        data = {
            'template' : {
                'title' : 'fotec | videotecas',
                'disciplines' : self.disciplines,
                'populars' : self.populars,
                'recents' : self.recents,
                'commenteds' : self.commenteds,
                'social_networks' : self.social_networks,
                'video_libraries' : video_libraries,
            }
        }

        return data

    def video_library(self, request):
        data = None

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
                    'disciplines' : self.disciplines,
                    'populars' : self.populars,
                    'recents' : self.recents,
                    'commenteds' : self.commenteds,
                    'social_networks' : self.social_networks,
                    'video_library' : video_library,
                }
            }
        finally:
            return data

    def events(self, request):
        data = None
        events = Event.objects.filter(active=True).order_by('-date')[:5]

        data = {
            'template' : {
                'title' : 'fotec | eventos',
                'disciplines' : self.disciplines,
                'populars' : self.populars,
                'recents' : self.recents,
                'commenteds' : self.commenteds,
                'social_networks' : self.social_networks,
                'events' : events,
            }
        }

        return data

    def event(self, request):
        data = None

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
                    'disciplines' : self.disciplines,
                    'populars' : self.populars,
                    'recents' : self.recents,
                    'commenteds' : self.commenteds,
                    'social_networks' : self.social_networks,
                    'event' : event,
                }
            }
        finally:
            return data
