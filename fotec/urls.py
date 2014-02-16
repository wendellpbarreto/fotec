from django.conf.urls import patterns, include, url
from django.views.generic import RedirectView
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


from fotec.apps.frontend.views import FrontEnd

admin.autodiscover()

urlpatterns = patterns('',
    # url(r'^$', include('fotec.apps.frontend.urls')),
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^redactor/', include('redactor.urls')),
    url(r'^admin/', include(admin.site.urls)),

    url(r'^$', RedirectView.as_view(url='/home/')),

	url(r'^(?P<slug>\w+)/$', FrontEnd.as_view(), name='frontend',),

)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += staticfiles_urlpatterns()