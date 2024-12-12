document.addEventListener('DOMContentLoaded', function () {
    // Функция для переключения видимости пароля
    function togglePasswordVisibility(inputId, iconId) {
        const passwordInput = document.getElementById(inputId);
        const icon = document.getElementById(iconId);

        // Проверка текущего типа инпута и переключение его между "password" и "text"
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }

    // Добавляем обработчик клика для первого инпута пароля
    const togglePassword = document.getElementById('toggle-password');
    if (togglePassword) {
        togglePassword.addEventListener('click', function () {
            togglePasswordVisibility('password-input', 'toggle-password');
        });
    }

    // Добавляем обработчик клика для второго инпута пароля (Подтверждение пароля)
    const toggleConfirmPassword = document.getElementById('toggle-confirm-password');
    if (toggleConfirmPassword) {
        toggleConfirmPassword.addEventListener('click', function () {
            togglePasswordVisibility('confirm-password-input', 'toggle-confirm-password');
        });
    }
});
