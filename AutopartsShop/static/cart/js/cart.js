document.addEventListener('DOMContentLoaded', () => {
    // Находим все строки корзины
    const cartRows = document.querySelectorAll('.cart-row');
    const emptyCart = document.querySelector('.empty-cart'); // Блок с сообщением о пустой корзине
    const content = document.querySelector('.content'); // Основной контент корзины
const totalPriceElement = document.querySelector('.value-total');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content'); // CSRF токен

    // Функция для обновления общей стоимости
    const updateTotalPrice = () => {
        let totalPrice = 0;

        // Проходим по всем товарам и суммируем их стоимость
        document.querySelectorAll('.cart-row').forEach(cartRow => {
            const quantityInput = cartRow.querySelector('.quantity-input');
            const priceElement = cartRow.querySelector('.cart-price');
            const price = parseFloat(priceElement.textContent.replace('₽', '').replace(/\s+/g, '')); // Извлекаем цену

            const quantity = parseInt(quantityInput.value, 10);
            totalPrice += price * quantity;
        });

        // Обновляем цену в интерфейсе
        totalPriceElement.textContent = `${totalPrice.toFixed(2)} ₽`;

        // Если корзина пуста, показываем блок с сообщением о пустой корзине, иначе скрываем
        if (totalPrice === 0) {
            emptyCart.style.display = 'flex';
            content.style.display = 'none';
        } else {
            emptyCart.style.display = 'none';
            content.style.display = 'flex';
        }
    };

    // Обновляем цену сразу при загрузке страницы
    updateTotalPrice();

    cartRows.forEach(cartRow => {
        const decrementButton = cartRow.querySelector('.quantity-btn:nth-child(1)'); // Кнопка минус
        const incrementButton = cartRow.querySelector('.quantity-btn:nth-child(3)'); // Кнопка плюс
        const quantityInput = cartRow.querySelector('.quantity-input'); // Поле количества
        const removeButton = cartRow.querySelector('.remove-btn'); // Кнопка удаления
        const productId = cartRow.getAttribute('data-item-id'); // Получаем id товара из data-item-id

        // Увеличение количества
        incrementButton.addEventListener('click', () => {
            const currentValue = parseInt(quantityInput.value, 10);
            quantityInput.value = currentValue + 1;
            updateTotalPrice();
            updateCartItem(productId, quantityInput.value); // Обновляем на сервере
        });

        // Уменьшение количества
        decrementButton.addEventListener('click', () => {
            const currentValue = parseInt(quantityInput.value, 10);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
                updateTotalPrice();
                updateCartItem(productId, quantityInput.value); // Обновляем на сервере
            } else {
                // Если количество равно 1, удаляем строку
                cartRow.remove();
                deleteCartItem(productId); // Удаляем на сервере
                updateTotalPrice();
            }
        });

        // Удаление товара при нажатии на кнопку удаления
        removeButton.addEventListener('click', () => {
            cartRow.remove();
            deleteCartItem(productId); // Удаляем на сервере
            updateTotalPrice();
        });
    });

    // Функция для обновления количества товара на сервере
    const updateCartItem = (productId, quantity) => {
        fetch(`/cart/update-item/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrfToken // CSRF токен
            },
            body: JSON.stringify({
                quantity: quantity,
                item_id: productId
            })
        }).then(response => response.json())
          .then(data => {
              if (data.status !== 'success') {
                  console.log('Ошибка обновления корзины');
              }
          })
          .catch(error => {
              console.error('Ошибка:', error);
          });
    };

    // Функция для удаления товара с корзины на сервере
    const deleteCartItem = (productId) => {
        fetch(`/cart/remove-item/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrfToken // CSRF токен
            },
            body: JSON.stringify({
                item_id: productId,
            })
        }).then(response => response.json())
          .then(data => {
              if (data.status !== 'success') {
                  console.log('Ошибка обновления корзины');
              }
          })
          .catch(error => {
              console.error('Ошибка:', error);
          });
    };
});
