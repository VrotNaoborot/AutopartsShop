from django.shortcuts import render
from django.db.models import Q
from django.http import JsonResponse
from shop.models import *


def index(request):
    return render(request, 'index.html')


def test(request):
    return render(request, 'test.html')


def catalog(request):
    type_product_list = request.GET.getlist('type')
    category = request.GET.get('category')
    mark = request.GET.get('mark')
    model = request.GET.get('model')

    all_products = Product.objects.all()

    # Фильтрация
    if type_product_list:
        all_products = all_products.filter(type_product__in=type_product_list)
    if category:
        subcategories = Subcategories.objects.filter(category_id=category)
        all_products = all_products.filter(subcategory__in=subcategories)
    if mark:
        all_products = all_products.filter(Q(brand_id=mark) | Q(brand_id__isnull=True))
        print(all_products)
    if model:
        all_products = all_products.filter(Q(model_id=model) | Q(model_id__isnull=True))

    print(all_products)
    context = {
        'products': all_products,
        'count_products': len(all_products)
    }
    return render(request, 'catalog.html', context=context)


def get_models_by_brand(request, brand_id):
    # Заглушка
    return JsonResponse(
        [
            {'id': 1,
             'name': 'A1'},
            {'id': 2,
             'name': 'A2'},
            {'id': 3,
             'name': 'A3'},
        ],
        safe=False
    )


def get_subcategories(request, subcategories_id):
    # Заглушка
    return JsonResponse(
        [
            {'id': 1,
             'name': 'subcategory1'},
            {'id': 2,
             'name': 'subcategory2'},
            {'id': 3,
             'name': 'subcategory3'},
        ],
        safe=False
    )
