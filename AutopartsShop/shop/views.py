from django.shortcuts import render
from django.http import JsonResponse


# Create your views here.


def index(request):
    return render(request, 'index.html')


def test(request):
    return render(request, 'test.html')


def catalog(request):
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
