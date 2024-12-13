from django.db import models
from django.contrib.auth.models import User


class Brand(models.Model):
    name = models.CharField(max_length=255, verbose_name="Название")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Бренд авто"
        verbose_name_plural = "Бренды авто"


class ModelProduct(models.Model):
    name = models.CharField(max_length=255, verbose_name="Название")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Модель авто"
        verbose_name_plural = "Модели авто"


class Manufacture(models.Model):
    name = models.CharField(max_length=255, verbose_name="Название")
    country = models.CharField(max_length=255, verbose_name="Страна производства")

    def __str__(self):
        return f"{self.name} {self.country}"

    class Meta:
        verbose_name = "Производитель"
        verbose_name_plural = "Производители"


class Attribute(models.Model):
    name = models.CharField(max_length=100, verbose_name="Название")
    value = models.CharField(max_length=100, verbose_name="Значение")
    key = models.CharField(max_length=100, verbose_name="Ед.измерения")

    def __str__(self):
        return f"{self.name} {self.value} {self.key}"

    class Meta:
        verbose_name = "Атрибут"
        verbose_name_plural = "Атрибуты"


class Category(models.Model):
    name = models.CharField(max_length=255, verbose_name="Название категории")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = "Категория"
        verbose_name_plural = "Категории"


class Subcategories(models.Model):
    name = models.CharField(max_length=255, verbose_name="Название подкатегории")
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Подкатегория"
        verbose_name_plural = "Подкатегории"


class Product(models.Model):
    TYPE_PRODUCT_CHOICES = [
        ('parts', 'Запчасть'),
        ('accessory', 'Аксессуар')
    ]
    article = models.CharField(max_length=25, verbose_name="Артикул")
    img1 = models.ImageField(verbose_name="Изображение1")
    img2 = models.ImageField(verbose_name="Изображение2")
    img3 = models.ImageField(verbose_name="Изображение3")
    img4 = models.ImageField(verbose_name="Изображение4")
    img5 = models.ImageField(verbose_name="Изображение5")
    name = models.CharField(max_length=150, verbose_name="Название товара")
    type_product = models.CharField(max_length=50, choices=TYPE_PRODUCT_CHOICES, verbose_name="Тип продукта")
    brand = models.ForeignKey(Brand, verbose_name="Бренд авто", on_delete=models.CASCADE, null=True, blank=True)
    model = models.ForeignKey(ModelProduct, verbose_name="Модель авто", on_delete=models.CASCADE, null=True, blank=True)
    manufacture = models.ForeignKey(Manufacture, verbose_name="Производитель товара", on_delete=models.CASCADE)
    price = models.IntegerField(verbose_name="Цена")
    subcategory = models.ForeignKey(Subcategories, verbose_name="Подкатегория", on_delete=models.CASCADE)
    attributes = models.ManyToManyField(Attribute, related_name="categories", verbose_name="Атрибуты")
    weight = models.IntegerField(verbose_name="Вес товара")
    description = models.CharField(max_length=1000, verbose_name="Описание")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = "Товар"
        verbose_name_plural = "Товары"


class Cart(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, verbose_name="Пользователь")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата создания")

    def __str__(self):
        return f"Корзина {self.user.username}"

    @property
    def total_price(self):
        """Рассчитывает общую стоимость корзины."""
        return sum(item.total_price for item in self.items.all())


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, related_name="items", on_delete=models.CASCADE, verbose_name="Корзина")
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name="Товар")
    quantity = models.PositiveIntegerField(default=1, verbose_name="Количество")

    def __str__(self):
        return f"{self.product.name} ({self.quantity})"

    @property
    def total_price(self):
        """Рассчитывает общую стоимость товара в корзине."""
        return self.product.price * self.quantity
