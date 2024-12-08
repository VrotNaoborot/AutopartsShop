from django.shortcuts import render
from django.http import JsonResponse


# Create your views here.


def index(request):
    return render(request, 'index.html')


def test(request):
    return render(request, 'test.html')


def catalog(request):
    mark = request.GET.get('mark')
    model = request.GET.get('model')
    type_product_list = request.GET.getlist('type')
    category = request.GET.get('category')

    print(f"MARK: {mark} | MODEL: {model} | TYPE: {type_product_list} | CATEGORY: {category}")
    return render(request, 'catalog.html')


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
