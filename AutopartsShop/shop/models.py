from django.db import models


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
    unit = models.CharField(max_length=100, verbose_name="Единица")
    value = models.CharField(max_length=100, verbose_name="Значение")

    def __str__(self):
        return f"{self.unit} {self.value}"

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
    img = models.ImageField(verbose_name="Изображение")
    name = models.CharField(max_length=150, verbose_name="Название товара")
    type_product = models.CharField(max_length=50, choices=TYPE_PRODUCT_CHOICES, verbose_name="Тип продукта")
    brand = models.ForeignKey(Brand, verbose_name="Бренд авто", on_delete=models.CASCADE, null=True, blank=True)
    model = models.ForeignKey(ModelProduct, verbose_name="Модель авто", on_delete=models.CASCADE, null=True, blank=True)
    manufacture = models.ForeignKey(Manufacture, verbose_name="Производитель товара", on_delete=models.CASCADE)
    price = models.IntegerField(verbose_name="Цена")
    subcategory = models.ForeignKey(Subcategories, verbose_name="Подкатегория", on_delete=models.CASCADE)
    attributes = models.ManyToManyField(Attribute, related_name="categories", verbose_name="Атрибуты")
    weight = models.IntegerField(verbose_name="Вес товара")

    def __str__(self):
        return f"{self.name}"

    class Meta:
        verbose_name = "Товар"
        verbose_name_plural = "Товары"
