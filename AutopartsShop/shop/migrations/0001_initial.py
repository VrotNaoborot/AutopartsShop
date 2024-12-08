# Generated by Django 5.1.3 on 2024-12-08 17:05

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Attribute',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('unit', models.CharField(max_length=100, verbose_name='Единица')),
                ('value', models.CharField(max_length=100, verbose_name='Значение')),
            ],
            options={
                'verbose_name': 'Атрибут',
                'verbose_name_plural': 'Атрибуты',
            },
        ),
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Название')),
            ],
            options={
                'verbose_name': 'Бренд авто',
                'verbose_name_plural': 'Бренды авто',
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Название категории')),
            ],
            options={
                'verbose_name': 'Категория',
                'verbose_name_plural': 'Категории',
            },
        ),
        migrations.CreateModel(
            name='Manufacture',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Название')),
                ('country', models.CharField(max_length=255, verbose_name='Страна производства')),
            ],
            options={
                'verbose_name': 'Производитель',
                'verbose_name_plural': 'Производители',
            },
        ),
        migrations.CreateModel(
            name='ModelProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Название')),
            ],
            options={
                'verbose_name': 'Модель авто',
                'verbose_name_plural': 'Модели авто',
            },
        ),
        migrations.CreateModel(
            name='Subcategories',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Название подкатегории')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.category', verbose_name='Категория')),
            ],
            options={
                'verbose_name': 'Подкатегория',
                'verbose_name_plural': 'Подкатегории',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.ImageField(upload_to='', verbose_name='Изображение')),
                ('name', models.CharField(max_length=150, verbose_name='Название товара')),
                ('type_product', models.CharField(choices=[('parts', 'Запчасть'), ('accessory', 'Аксессуар')], max_length=50, verbose_name='Тип продукта')),
                ('price', models.IntegerField(verbose_name='Цена')),
                ('attributes', models.ManyToManyField(related_name='categories', to='shop.attribute', verbose_name='Атрибуты')),
                ('brand', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='shop.brand', verbose_name='Бренд авто')),
                ('manufacture', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.manufacture', verbose_name='Производитель товара')),
                ('model', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='shop.modelproduct', verbose_name='Модель авто')),
                ('subcategory', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.subcategories', verbose_name='Подкатегория')),
            ],
            options={
                'verbose_name': 'Товар',
                'verbose_name_plural': 'Товары',
            },
        ),
    ]
