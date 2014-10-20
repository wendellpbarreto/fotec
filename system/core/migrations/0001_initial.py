# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import sorl.thumbnail.fields
import system.core.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='About',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('body', models.TextField(help_text='About body', max_length=5120, verbose_name='Body')),
            ],
            options={
                'verbose_name': 'About',
                'verbose_name_plural': 'Abouts',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('street', models.CharField(help_text='Address street', max_length=32, verbose_name='Street')),
                ('number', models.CharField(help_text='Address number', max_length=8, verbose_name='Number')),
                ('complement', models.CharField(help_text='Address complement', max_length=64, verbose_name='Complement')),
                ('district', models.CharField(help_text='Address district', max_length=32, verbose_name='District')),
                ('zip_code', models.IntegerField(help_text='Address zip code', max_length=8, verbose_name='Zip code')),
                ('city', models.CharField(help_text='Address city', max_length=32, verbose_name='City')),
                ('state', models.CharField(help_text='Address state', max_length=2, verbose_name='State', choices=[(b'AC', b'AC'), (b'AL', b'AL'), (b'AP', b'AP'), (b'AP', b'AP'), (b'BA', b'BA'), (b'CE', b'CE'), (b'DF', b'DF'), (b'GO', b'GO'), (b'ES', b'ES'), (b'MA', b'MA'), (b'MT', b'MT'), (b'MS', b'MS'), (b'MG', b'MG'), (b'PA', b'PA'), (b'PB', b'PB'), (b'PR', b'PR'), (b'PE', b'PE'), (b'PI', b'PI'), (b'RJ', b'RJ'), (b'RN', b'RN'), (b'RS', b'RS'), (b'RO', b'RO'), (b'RR', b'RR'), (b'SP', b'SP'), (b'SC', b'SC'), (b'SE', b'SE'), (b'TO', b'TO')])),
            ],
            options={
                'verbose_name': 'Address',
                'verbose_name_plural': 'Addresses',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Author',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Author name', max_length=64, verbose_name='Name')),
                ('about', models.TextField(help_text='Author about', max_length=256, verbose_name='About', blank=True)),
                ('email', models.EmailField(help_text='Author email', max_length=32, verbose_name='Email', blank=True)),
                ('phone', models.CharField(help_text='Author phone', max_length=32, verbose_name='Phone', blank=True)),
                ('photo', sorl.thumbnail.fields.ImageField(blank=True, help_text='Author photo', max_length=256, upload_to=b'authors', validators=[system.core.models.validate_photo])),
            ],
            options={
                'verbose_name': 'Author',
                'verbose_name_plural': 'Authors',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(help_text='Contact type', max_length=16, verbose_name='Type', choices=[(b'email', b'E-mail'), (b'phone', b'Phone number'), (b'skype', b'Skype id')])),
                ('value', models.CharField(help_text='Contact value', max_length=32, verbose_name='Value')),
            ],
            options={
                'verbose_name': 'Contact',
                'verbose_name_plural': 'Contacts',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CurricularPractice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Curricular practice name', max_length=32, verbose_name='Name')),
            ],
            options={
                'verbose_name': 'Curricular practice',
                'verbose_name_plural': 'Curricular practices',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Discipline',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Discipline name', unique=True, max_length=32, verbose_name='Discipline')),
            ],
            options={
                'verbose_name': 'Discipline',
                'verbose_name_plural': 'Disciplines',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Editorial',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Editorial name', unique=True, max_length=32, verbose_name='Editorial')),
            ],
            options={
                'verbose_name': 'Editorial',
                'verbose_name_plural': 'Editorials',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=16, choices=[(b'notice', b'Notice'), (b'photogallery', b'Photogallery'), (b'video library', b'Video Library'), (b'podcast', b'Podcast')])),
                ('views', models.IntegerField(default=0, max_length=32)),
                ('comments', models.IntegerField(default=0, max_length=32)),
                ('likes', models.IntegerField(default=0, max_length=32)),
                ('active', models.BooleanField(default=True, help_text='Is this active?', verbose_name='Active')),
                ('featured', models.BooleanField(default=True, help_text='Is this in featured session?', verbose_name='Featured')),
                ('date', models.DateField(help_text='Date', verbose_name='Date')),
                ('date_modified', models.DateTimeField(auto_now=True, verbose_name='Last modified')),
                ('title', models.CharField(help_text='Title', max_length=64, verbose_name='Title')),
                ('subtitle', models.CharField(help_text='Subtitle', max_length=128, verbose_name='Subtitle', blank=True)),
                ('body', models.TextField(help_text='Body', max_length=10240, verbose_name='Body')),
            ],
            options={
                'verbose_name': 'Event',
                'verbose_name_plural': 'Events',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Member',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Member name', max_length=64, verbose_name='Name')),
                ('about', models.TextField(help_text='Member about', max_length=256, verbose_name='About', blank=True)),
                ('email', models.EmailField(help_text='Member email', max_length=32, verbose_name='Email', blank=True)),
                ('phone', models.CharField(help_text='Member phone', max_length=32, verbose_name='Phone', blank=True)),
                ('photo', sorl.thumbnail.fields.ImageField(help_text='Member photo', max_length=256, upload_to=b'members', validators=[system.core.models.validate_photo])),
            ],
            options={
                'verbose_name': 'Member',
                'verbose_name_plural': 'Members',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Notice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=16, choices=[(b'notice', b'Notice'), (b'photogallery', b'Photogallery'), (b'video library', b'Video Library'), (b'podcast', b'Podcast')])),
                ('views', models.IntegerField(default=0, max_length=32)),
                ('comments', models.IntegerField(default=0, max_length=32)),
                ('likes', models.IntegerField(default=0, max_length=32)),
                ('active', models.BooleanField(default=True, help_text='Is this active?', verbose_name='Active')),
                ('featured', models.BooleanField(default=True, help_text='Is this in featured session?', verbose_name='Featured')),
                ('date', models.DateField(help_text='Date', verbose_name='Date')),
                ('date_modified', models.DateTimeField(auto_now=True, verbose_name='Last modified')),
                ('title', models.CharField(help_text='Title', max_length=64, verbose_name='Title')),
                ('subtitle', models.CharField(help_text='Subtitle', max_length=128, verbose_name='Subtitle', blank=True)),
                ('body', models.TextField(help_text='Body', max_length=10240, verbose_name='Body')),
                ('photo', sorl.thumbnail.fields.ImageField(help_text='Notice photo', upload_to=b'news', max_length=256, verbose_name='Photo', validators=[system.core.models.validate_photo])),
                ('author', models.ForeignKey(verbose_name='Author', to='core.Author', help_text='Author')),
                ('curricular_practice', models.ForeignKey(blank=True, to='core.CurricularPractice', help_text='Notice curricular practice', null=True, verbose_name='Curricular practice')),
                ('discipline', models.ForeignKey(blank=True, to='core.Discipline', help_text='Notice discipline', null=True, verbose_name='Discipline')),
                ('editorial', models.ForeignKey(verbose_name='Editorial', to='core.Editorial', help_text='Notice editorial')),
            ],
            options={
                'verbose_name': 'Notice',
                'verbose_name_plural': 'Notices',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(help_text='Photo title', max_length=128, verbose_name='Title')),
                ('photo', sorl.thumbnail.fields.ImageField(help_text='Photo', max_length=256, upload_to=b'photogallery', validators=[system.core.models.validate_photo])),
            ],
            options={
                'verbose_name': 'Photo',
                'verbose_name_plural': 'Photos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Photogallery',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=16, choices=[(b'notice', b'Notice'), (b'photogallery', b'Photogallery'), (b'video library', b'Video Library'), (b'podcast', b'Podcast')])),
                ('views', models.IntegerField(default=0, max_length=32)),
                ('comments', models.IntegerField(default=0, max_length=32)),
                ('likes', models.IntegerField(default=0, max_length=32)),
                ('active', models.BooleanField(default=True, help_text='Is this active?', verbose_name='Active')),
                ('featured', models.BooleanField(default=True, help_text='Is this in featured session?', verbose_name='Featured')),
                ('date', models.DateField(help_text='Date', verbose_name='Date')),
                ('date_modified', models.DateTimeField(auto_now=True, verbose_name='Last modified')),
                ('title', models.CharField(help_text='Title', max_length=64, verbose_name='Title')),
                ('subtitle', models.CharField(help_text='Subtitle', max_length=128, verbose_name='Subtitle', blank=True)),
                ('body', models.TextField(help_text='Body', max_length=10240, verbose_name='Body')),
                ('curricular_practice', models.ForeignKey(blank=True, to='core.CurricularPractice', help_text='Photogallery curricular practice', null=True, verbose_name='Curricular practice')),
                ('discipline', models.ForeignKey(blank=True, to='core.Discipline', help_text='Photogallery discipline', null=True, verbose_name='Discipline')),
                ('editorial', models.ForeignKey(verbose_name='Editorial', to='core.Editorial', help_text='Photogallery editorial')),
            ],
            options={
                'verbose_name': 'Photogallery',
                'verbose_name_plural': 'Photogalleries',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Photographer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Photographer name', max_length=64, verbose_name='Name')),
                ('about', models.TextField(help_text='Photographer about', max_length=256, verbose_name='About', blank=True)),
                ('email', models.EmailField(help_text='Photographer email', max_length=32, verbose_name='Email', blank=True)),
                ('phone', models.CharField(help_text='Photographer phone', max_length=32, verbose_name='Phone', blank=True)),
                ('photo', sorl.thumbnail.fields.ImageField(blank=True, help_text='Photographer photo', max_length=256, upload_to=b'photographers', validators=[system.core.models.validate_photo])),
            ],
            options={
                'verbose_name': 'Photographer',
                'verbose_name_plural': 'Photographers',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Podcast',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=16, choices=[(b'notice', b'Notice'), (b'photogallery', b'Photogallery'), (b'video library', b'Video Library'), (b'podcast', b'Podcast')])),
                ('views', models.IntegerField(default=0, max_length=32)),
                ('comments', models.IntegerField(default=0, max_length=32)),
                ('likes', models.IntegerField(default=0, max_length=32)),
                ('active', models.BooleanField(default=True, help_text='Is this active?', verbose_name='Active')),
                ('featured', models.BooleanField(default=True, help_text='Is this in featured session?', verbose_name='Featured')),
                ('date', models.DateField(help_text='Date', verbose_name='Date')),
                ('date_modified', models.DateTimeField(auto_now=True, verbose_name='Last modified')),
                ('title', models.CharField(help_text='Title', max_length=64, verbose_name='Title')),
                ('subtitle', models.CharField(help_text='Subtitle', max_length=128, verbose_name='Subtitle', blank=True)),
                ('body', models.TextField(help_text='Body', max_length=10240, verbose_name='Body')),
                ('download_url', models.URLField(help_text='Podcast download url', max_length=128, verbose_name='Download URL', blank=True)),
            ],
            options={
                'verbose_name': 'Podcast',
                'verbose_name_plural': 'Podcasts',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Role',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text='Role name', max_length=64, verbose_name='Role')),
            ],
            options={
                'verbose_name': 'Role',
                'verbose_name_plural': 'Roles',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SocialNetwork',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(help_text='Social network type', max_length=16, verbose_name='Type', choices=[(b'facebook', b'Facebook'), (b'twitter', b'Twitter'), (b'instagram', b'Instagram'), (b'googleplus', b'Google +')])),
                ('url', models.CharField(help_text='Social network url', max_length=32, verbose_name='URL')),
            ],
            options={
                'verbose_name': 'Social network',
                'verbose_name_plural': 'Social networks',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Video',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('youtube', models.CharField(help_text='Ex: umMIcZODm2k of http://www.youtube.com/embed/umMIcZODm2k', max_length=32, verbose_name='Youtube code', blank=True)),
                ('vimeo', models.CharField(help_text='Ex: 85228844 of http://player.vimeo.com/video/85228844', max_length=32, verbose_name='Vimeo code', blank=True)),
            ],
            options={
                'verbose_name': 'Video',
                'verbose_name_plural': 'Videos',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='VideoLibrary',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=16, choices=[(b'notice', b'Notice'), (b'photogallery', b'Photogallery'), (b'video library', b'Video Library'), (b'podcast', b'Podcast')])),
                ('views', models.IntegerField(default=0, max_length=32)),
                ('comments', models.IntegerField(default=0, max_length=32)),
                ('likes', models.IntegerField(default=0, max_length=32)),
                ('active', models.BooleanField(default=True, help_text='Is this active?', verbose_name='Active')),
                ('featured', models.BooleanField(default=True, help_text='Is this in featured session?', verbose_name='Featured')),
                ('date', models.DateField(help_text='Date', verbose_name='Date')),
                ('date_modified', models.DateTimeField(auto_now=True, verbose_name='Last modified')),
                ('title', models.CharField(help_text='Title', max_length=64, verbose_name='Title')),
                ('subtitle', models.CharField(help_text='Subtitle', max_length=128, verbose_name='Subtitle', blank=True)),
                ('body', models.TextField(help_text='Body', max_length=10240, verbose_name='Body')),
                ('curricular_practice', models.ForeignKey(blank=True, to='core.CurricularPractice', help_text='Video library curricular practice', null=True, verbose_name='Curricular practice')),
                ('discipline', models.ForeignKey(blank=True, to='core.Discipline', help_text='Video library discipline', null=True, verbose_name='Discipline')),
                ('editorial', models.ForeignKey(verbose_name='Editorial', to='core.Editorial', help_text='Video library editorial')),
            ],
            options={
                'verbose_name': 'Video library',
                'verbose_name_plural': 'Video libraries',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='video',
            name='video_library',
            field=models.ForeignKey(related_name=b'videos', to='core.VideoLibrary'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='photo',
            name='photogallery',
            field=models.ForeignKey(related_name=b'photos', to='core.Photogallery'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='photo',
            name='photographer',
            field=models.ForeignKey(related_name=b'photo_photographer', verbose_name='Photographer', to='core.Photographer', help_text='Notice photographer'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='notice',
            name='photographer',
            field=models.ForeignKey(verbose_name='Photographer', to='core.Photographer', help_text='Notice photographer'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='member',
            name='role',
            field=models.ForeignKey(verbose_name='Role', to='core.Role', help_text='Member role'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='notices',
            field=models.ManyToManyField(help_text='Event notices', to='core.Notice', verbose_name='Notice', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='photogalleries',
            field=models.ManyToManyField(help_text='Event photogalleries', to='core.Photogallery', verbose_name='Photogalleries', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='podcasts',
            field=models.ManyToManyField(help_text='Event podcasts', to='core.Podcast', verbose_name='Podcasts', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='event',
            name='video_libraries',
            field=models.ManyToManyField(help_text='Event video libraries', to='core.VideoLibrary', verbose_name='Video libraries', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='curricularpractice',
            name='discipline',
            field=models.ForeignKey(related_name=b'curricular_practices', verbose_name='Discipline', to='core.Discipline', help_text='Curricular practice discipline'),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='curricularpractice',
            unique_together=set([('name', 'discipline')]),
        ),
    ]
