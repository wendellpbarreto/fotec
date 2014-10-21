# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='author',
            field=models.ForeignKey(default=1, verbose_name='Author', to='core.Author', help_text='Author'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='photogallery',
            name='author',
            field=models.ForeignKey(default=1, verbose_name='Author', to='core.Author', help_text='Author'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='podcast',
            name='author',
            field=models.ForeignKey(default=1, verbose_name='Author', to='core.Author', help_text='Author'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='videolibrary',
            name='author',
            field=models.ForeignKey(default=1, verbose_name='Author', to='core.Author', help_text='Author'),
            preserve_default=False,
        ),
    ]
