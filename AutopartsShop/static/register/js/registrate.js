document.addEventListener("DOMContentLoaded", function() {
    const registrateButton = document.getElementById('registrate');
    const emailInput = document.querySelector('#email .inp');
    const passwordInput = document.getElementById('password-input');
    const confirmPasswordInput = document.getElementById('confirm-password-input');
    const confirmCodeInput = document.getElementById('masked-input');
    const errorDiv = document.querySelector('.error');
    const confirmCodeDiv = document.getElementById('confirm-code');
    const formInputs = document.querySelectorAll('.form-input');

    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    // Функция отображения ошибок
    function showError(message) {
        errorDiv.style.display = 'block';
        errorDiv.textContent = message;
    }

    // Скрытие ошибок
    function hideError() {
        errorDiv.style.display = 'none';
    }

    // Обработчик нажатия на кнопку регистрации
    registrateButton.addEventListener('click', function() {
        hideError(); // Скрыть старые ошибки

        // Получаем данные из формы
        const email = emailInput.value.trim();
        const password = passwordInput.value.trim();
        const confirmPassword = confirmPasswordInput.value.trim();

        // Проверка на пустые поля
        if (!email || !password || !confirmPassword) {
            showError("Все поля должны быть заполнены.");
            return;
        }

        // Проверка на совпадение паролей
        if (password !== confirmPassword) {
            showError("Пароли не совпадают.");
            return;
        }

        // Отправка данных на сервер для регистрации
        fetch('/registrate/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrfToken
            },
            body: JSON.stringify({
                email: email,
                password: password,
                confirm_password: confirmPassword
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                showError(data.error); // Отобразить ошибку
            } else if (data.info) {
                // Если код подтверждения отправлен, показываем поле для ввода кода
                confirmCodeDiv.style.display = 'flex';
            }
        })
        .catch(() => showError("Неизвестная ошибка"));
    });

    // Обработчик для ввода кода подтверждения
    confirmCodeInput.addEventListener('input', function() {
        const verificationCode = confirmCodeInput.value.trim();

        if (verificationCode.length === 7) { // Длина кода подтверждения
            fetch('/registrate/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrfToken // Используем извлеченный CSRF токен
                },
                body: JSON.stringify({
                    email: emailInput.value.trim(),
                    password: passwordInput.value.trim(),
                    confirm_password: confirmPasswordInput.value.trim(),
                    verification_code: verificationCode
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    showError(data.error); // Если ошибка, показать
                }
                else {
                    window.location.href = '/'; // Редирект на главную страницу после успешной регистрации
                }
            })
            .catch(() => showError("Неизвестная ошибка"));
        }
    });
});
