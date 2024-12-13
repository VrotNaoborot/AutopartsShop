document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.product-to-cart');

    // Получаем CSRF-токен из мета-тега
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    buttons.forEach(button => {
        button.addEventListener('click', function () {
            const productId = this.getAttribute('data-product-id');

            if (productId) {
                fetch('/cart/add/', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRFToken': csrfToken
                    },
                    body: JSON.stringify({ product_id: productId })
                })
                .then(response => response.json())
                .then(data => {
                    console.log('Товар добавлен в корзину:', data);
                })
                .catch(error => {
                    console.error('Ошибка при добавлении товара в корзину:', error);
                });
            } else {
                console.error('ID продукта не найден.');
            }
        });
    });
});
