import json
from django.views.decorators.http import require_POST
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Q
from django.http import JsonResponse
from shop.models import *
import random
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as django_login, logout
from django.core.mail import send_mail
import string
from django.contrib.auth.forms import AuthenticationForm


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


def card_product(request, card_id):
    product = Product.objects.get(id=card_id)
    attributes = product.attributes.all()
    return render(request, 'card_product.html', context={'product': product, 'attributes': attributes})


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


@login_required
def cart(request):
    # Получаем корзину пользователя
    cart = Cart.objects.filter(user=request.user).first()

    if cart:
        # Оптимизируем запросы, чтобы не делать дополнительные обращения к базе
        items = CartItem.objects.filter(cart=cart).select_related('product')
    else:
        items = []

    # Формируем контекст для шаблона
    context = {
        'items': items,
        'total_price': cart.total_price
    }

    return render(request, 'cart.html', context=context)


@require_POST
def add_to_cart(request):
    data = json.loads(request.body)
    product_id = data.get('product_id')

    if not request.user.is_authenticated:
        return JsonResponse({'error': 'Необходимо авторизоваться для добавления товара в корзину'}, status=403)

    product = get_object_or_404(Product, id=product_id)

    cart, created = Cart.objects.get_or_create(user=request.user)

    cart_item, created = CartItem.objects.get_or_create(cart=cart, product=product)

    if not created:
        # Если элемент уже есть, увеличиваем количество
        cart_item.quantity += 1
        cart_item.save()

    return JsonResponse({
        'message': 'Товар успешно добавлен в корзину',
        'product_id': product.id,
        'quantity': cart_item.quantity,
    })


def login_view(request):
    return render(request, 'login.html')


def register_view(request):
    return render(request, 'register.html')


def register(request):
    data = json.loads(request.body)
    email = data.get('email')
    first_password = data.get('password')
    second_password = data.get('confirm_password')
    verification_code = data.get('verification_code', None)

    if mail_is_registrate(email):
        return JsonResponse(
            {"error": "Данная почта уже зарегистрирована"}
        )
    if verification_code:
        stored_code = request.session.get('verification_code')
        if stored_code == "".join(verification_code.split()):
            if first_password == second_password:
                user = User.objects.create_user(
                    username=email,
                    email=email,
                    password=first_password
                )
                user.save()
                django_login(request, user)
                return JsonResponse({'info': 'Регистрация прошла успешно'})
    else:
        code = generate_verification_code()
        request.session['verification_code'] = code
        try:
            send_mail(
                'Verification Code',
                f'Your verification code is {code}',
                'kakoytann@gmail.com',
                [email],
                fail_silently=False,
            )
            return JsonResponse(
                {"info": "Код подтверждения отправлен"}
            )
        except Exception as ex:
            return JsonResponse(
                {"error": f"Неизвестная ошибка: {ex}"}
            )


def login(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            django_login(request, user)
            return redirect('/')  # Перенаправление на главную страницу
        else:
            # Если форма невалидна, выводим ошибку на странице входа
            return render(request, 'login.html', {'form': form})
    else:
        # Если метод GET, показываем пустую форму
        form = AuthenticationForm()
        return render(request, 'login.html', {'form': form})


def user_logout(request):
    logout(request)  # Завершает сессию пользователя
    return redirect('/')


def generate_verification_code(length=6):
    """Генерирует случайный код подтверждения."""
    return ''.join(random.choices(string.digits, k=length))


def mail_is_registrate(mail):
    return User.objects.filter(email=mail).exists()
