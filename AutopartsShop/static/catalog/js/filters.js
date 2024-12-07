document.addEventListener("DOMContentLoaded", () => {
    const marksFilter = document.getElementById("marks");
    const modelsContainer = document.getElementById("models");
    const categoriesContainer = document.getElementById("categories");
    const marksDropdown = marksFilter.querySelector(".choices__list--dropdown");
    const modelsDropdown = modelsContainer.querySelector(".choices__list--dropdown");
    const categoriesDropdown = categoriesContainer.querySelector(".choices__list--dropdown");

    const toggleButtonMarks = marksFilter.querySelector(".choices__inner");
    const toggleButtonModels = modelsContainer.querySelector(".choices__inner");
    const toggleButtonCategories = categoriesContainer.querySelector(".choices__inner");

    const toggleTextMarks = toggleButtonMarks.querySelector(".choices__item");
    const toggleTextModels = toggleButtonModels.querySelector(".choices__item");
    const toggleTextCategories = toggleButtonCategories.querySelector(".choices__item");

    const applyButton = document.querySelector(".apply-btn");

    // Переменная для отслеживания активного выпадающего меню
    let activeDropdown = null;

    // Функция для закрытия всех открытых выпадающих меню
    const closeAllDropdowns = () => {
        if (activeDropdown) {
            activeDropdown.classList.remove("is-active");
            activeDropdown.setAttribute("aria-expanded", "false");
        }
    };

    // Открытие/закрытие выпадающего списка марок
    toggleButtonMarks.addEventListener("click", () => {
        const isActive = marksDropdown.classList.contains("is-active");
        // Если какое-то меню активно, закрываем его
        closeAllDropdowns();

        if (!isActive) {
            marksDropdown.classList.add("is-active");
            marksDropdown.setAttribute("aria-expanded", "true");
            activeDropdown = marksDropdown;
        } else {
            activeDropdown = null;
        }
    });

    // Закрытие выпадающего списка марок при клике вне блока
    document.addEventListener("click", (event) => {
        if (!marksFilter.contains(event.target)) {
            marksDropdown.classList.remove("is-active");
            marksDropdown.setAttribute("aria-expanded", "false");
        }
    });

    // Открытие/закрытие выпадающего списка моделей
    toggleButtonModels.addEventListener("click", () => {
        const isActive = modelsDropdown.classList.contains("is-active");
        // Если какое-то меню активно, закрываем его
        closeAllDropdowns();

        if (!isActive) {
            modelsDropdown.classList.add("is-active");
            modelsDropdown.setAttribute("aria-expanded", "true");
            activeDropdown = modelsDropdown;
        } else {
            activeDropdown = null;
        }
    });

    // Закрытие выпадающего списка моделей при клике вне блока
    document.addEventListener("click", (event) => {
        if (!modelsContainer.contains(event.target) && !marksFilter.contains(event.target)) {
            modelsDropdown.classList.remove("is-active");
            modelsDropdown.setAttribute("aria-expanded", "false");
        }
    });

    // Открытие/закрытие выпадающего списка категорий
    toggleButtonCategories.addEventListener("click", () => {
        const isActive = categoriesDropdown.classList.contains("is-active");
        // Если какое-то меню активно, закрываем его
        closeAllDropdowns();

        if (!isActive) {
            categoriesDropdown.classList.add("is-active");
            categoriesDropdown.setAttribute("aria-expanded", "true");
            activeDropdown = categoriesDropdown;
        } else {
            activeDropdown = null;
        }
    });

    // Закрытие выпадающего списка категорий при клике вне блока
    document.addEventListener("click", (event) => {
        if (!categoriesContainer.contains(event.target) && !marksFilter.contains(event.target) && !modelsContainer.contains(event.target)) {
            categoriesDropdown.classList.remove("is-active");
            categoriesDropdown.setAttribute("aria-expanded", "false");
        }
    });

    // Логика выбора марки
    marksDropdown.addEventListener("click", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            const selectedText = target.textContent.trim();
            const selectedId = target.getAttribute("data-id");

            // Обновляем текст и data-id текущей марки
            toggleTextMarks.textContent = selectedText;
            toggleTextMarks.setAttribute("data-id", selectedId);

            applyButton.style.display = "flex"; // Делаем кнопку видимой

            // Закрываем выпадающий список марок
            marksDropdown.classList.remove("is-active");
            marksDropdown.setAttribute("aria-expanded", "false");

            // Отправка запроса на сервер для получения моделей
            fetch(`/get-models/${selectedId}/`)
                .then(response => response.json())
                .then(models => {
                    // Очистка списка моделей перед отрисовкой
                    modelsDropdown.innerHTML = '';

                    // Добавляем модели в выпадающий список
                    models.forEach(model => {
                        const modelItem = document.createElement('div');
                        modelItem.classList.add("choices__item", "choices__item--selectable");
                        modelItem.textContent = model.name;
                        modelItem.setAttribute("data-id", model.id);
                        modelItem.setAttribute("role", "option");
                        modelsDropdown.appendChild(modelItem);
                    });

                    // Показываем блок моделей, если модели доступны
                    if (models.length > 0) {
                        modelsContainer.style.display = 'block';
                    }

                    // Открываем выпадающий список моделей
                    modelsDropdown.classList.add("is-active");
                    modelsDropdown.setAttribute("aria-expanded", "true");
                })
                .catch(error => console.error('Ошибка при запросе моделей:', error));
        }
    });

    // Логика выбора модели
    modelsDropdown.addEventListener("click", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            const selectedModelText = target.textContent.trim();
            const selectedModelId = target.getAttribute("data-id");

            // Обновляем текст и data-id выбранной модели
            toggleTextModels.textContent = selectedModelText;
            toggleTextModels.setAttribute("data-id", selectedModelId);

            // Закрываем выпадающий список моделей
            modelsDropdown.classList.remove("is-active");
            modelsDropdown.setAttribute("aria-expanded", "false");
        }
    });

    // Логика выбора категории
    categoriesDropdown.addEventListener("click", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            const selectedCategoryText = target.textContent.trim();
            const selectedCategoryId = target.getAttribute("data-id");

            // Обновляем текст и data-id выбранной категории
            toggleTextCategories.textContent = selectedCategoryText;
            toggleTextCategories.setAttribute("data-id", selectedCategoryId);

            // Закрываем выпадающий список категорий
            categoriesDropdown.classList.remove("is-active");
            categoriesDropdown.setAttribute("aria-expanded", "false");
        }
    });

    // Добавление is-highlighted при наведении на элементы списка марок
    marksDropdown.addEventListener("mouseover", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            marksDropdown.querySelectorAll(".choices__item").forEach((item) => {
                item.classList.remove("is-highlighted");
            });
            target.classList.add("is-highlighted");
        }
    });

    // Удаление is-highlighted при уходе курсора с марки
    marksDropdown.addEventListener("mouseout", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            target.classList.remove("is-highlighted");
        }
    });

    // Добавление is-highlighted при наведении на элементы списка моделей
    modelsDropdown.addEventListener("mouseover", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            modelsDropdown.querySelectorAll(".choices__item").forEach((item) => {
                item.classList.remove("is-highlighted");
            });
            target.classList.add("is-highlighted");
        }
    });

    // Удаление is-highlighted при уходе курсора с модели
    modelsDropdown.addEventListener("mouseout", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            target.classList.remove("is-highlighted");
        }
    });

    // Добавление is-highlighted при наведении на элементы списка категорий
    categoriesDropdown.addEventListener("mouseover", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            categoriesDropdown.querySelectorAll(".choices__item").forEach((item) => {
                item.classList.remove("is-highlighted");
            });
            target.classList.add("is-highlighted");
        }
    });

    // Удаление is-highlighted при уходе курсора с категории
    categoriesDropdown.addEventListener("mouseout", (event) => {
        const target = event.target.closest(".choices__item");
        if (target) {
            target.classList.remove("is-highlighted");
        }
    });
});
