document.getElementById('masked-input').addEventListener('input', function(e) {
    // Убираем все символы, кроме цифр
    let value = this.value.replace(/\D/g, '');

    // Формируем маску с пробелом
    if (value.length > 3) {
        value = value.slice(0, 3) + ' ' + value.slice(3, 6) + (value.length > 6 ? ' ' + value.slice(6, 9) : '');
    }

    this.value = value;
});
