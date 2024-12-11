document.addEventListener('DOMContentLoaded', () => {
    // Находим все строки корзины
    const cartRows = document.querySelectorAll('.cart-row');

    cartRows.forEach(cartRow => {
        const decrementButton = cartRow.querySelector('.quantity-btn:nth-child(1)'); // Кнопка минус
        const incrementButton = cartRow.querySelector('.quantity-btn:nth-child(3)'); // Кнопка плюс
        const quantityInput = cartRow.querySelector('.quantity-input'); // Поле количества
        const removeButton = cartRow.querySelector('.remove-btn'); // Кнопка удаления

        // Увеличение количества
        incrementButton.addEventListener('click', () => {
            const currentValue = parseInt(quantityInput.value, 10);
            quantityInput.value = currentValue + 1;
        });

        // Уменьшение количества
        decrementButton.addEventListener('click', () => {
            const currentValue = parseInt(quantityInput.value, 10);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            } else {
                // Если количество равно 1, удаляем строку
                cartRow.remove();
            }
        });

        // Удаление товара при нажатии на кнопку удаления
        removeButton.addEventListener('click', () => {
            cartRow.remove();
        });
    });
});
