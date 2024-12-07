document.addEventListener("DOMContentLoaded", () => {
    // Функция для получения значений параметра из URL
    const getUrlParams = (param) => {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.getAll(param); // Получаем все значения параметра
    };

    // Функция для настройки выпадающего списка
    const setupDropdown = (containerId, paramName) => {
        const container = document.getElementById(containerId);
        const toggleTextElement = container.querySelector(".choices__item");
        const selectedId = getUrlParams(paramName)[0]; // Берём первое значение, если есть

        if (selectedId) {
            // Ищем элемент с data-id, равным выбранному ID
            const matchingItem = container.querySelector(`[data-id="${selectedId}"]`);
            if (matchingItem) {
                toggleTextElement.textContent = matchingItem.textContent.trim(); // Устанавливаем текст элемента
                toggleTextElement.setAttribute("data-id", selectedId); // Обновляем ID в атрибуте
            }
        }
    };

    // Динамическая загрузка моделей на основе выбранной марки
    const loadModels = (brandId, selectedModelId) => {
        const modelsContainer = document.getElementById("models");
        modelsContainer.style.display = "block";
        const toggleTextElement = modelsContainer.querySelector(".choices__item");
        const dropdownList = modelsContainer.querySelector(".choices__list[role='listbox']");

        if (!brandId) return;

        // Очистка старых моделей
        dropdownList.innerHTML = "";

        // Выполняем AJAX-запрос для получения моделей
        fetch(`/get-models/${brandId}/`)
            .then((response) => response.json())
            .then((models) => {
                models.forEach((model) => {
                    const optionElement = document.createElement("div");
                    optionElement.id = `choices--models-item-choice-${model.id}`;
                    optionElement.className = "choices__item choices__item--choice is-selected choices__item--selectable";
                    optionElement.setAttribute("data-id", model.id);
                    optionElement.setAttribute("role", "option");
                    optionElement.textContent = model.name;

                    // Добавляем элемент в список
                    dropdownList.appendChild(optionElement);

                    // Устанавливаем выбранную модель, если передана
                    if (model.id === parseInt(selectedModelId)) {
                        toggleTextElement.textContent = model.name;
                        toggleTextElement.setAttribute("data-id", model.id);
                    }
                });
            })
            .catch((error) => {
                console.error("Ошибка загрузки моделей:", error);
            });
    };

    // Обработка марки
    const selectedBrandId = getUrlParams("mark")[0]; // Берём первое значение
    const selectedModelId = getUrlParams("model")[0]; // Берём первое значение

    setupDropdown("marks", "mark"); // Настройка марки
    if (selectedBrandId) {
        loadModels(selectedBrandId, selectedModelId); // Загружаем модели для выбранной марки
    }

    // Обработка категорий
    const setupCategory = () => {
        const selectedCategory = getUrlParams("category")[0]; // Берём первую категорию
        const categoryContainer = document.getElementById("categories");
        const toggleTextElement = categoryContainer.querySelector(".choices__item");

        if (selectedCategory) {
            const matchingCategory = categoryContainer.querySelector(`[data-id="${selectedCategory}"]`);
            if (matchingCategory) {
                toggleTextElement.textContent = matchingCategory.textContent.trim(); // Устанавливаем текст категории
                toggleTextElement.setAttribute("data-id", selectedCategory); // Обновляем ID
            }
        }
    };

    setupCategory(); // Настройка категории

    // Обработка чекбоксов
    const selectedTypes = getUrlParams("type"); // Получаем все выбранные типы
    const checkboxPart = document.getElementById("filter-part");
    const checkboxAccessory = document.getElementById("filter-accessory");

    if (selectedTypes.includes("parts")) {
        checkboxPart.checked = true;
    }
    if (selectedTypes.includes("accessory")) {
        checkboxAccessory.checked = true;
    }

    // Логика для отображения кнопки
    const applyButton = document.querySelector(".apply-btn");
    if (
        selectedTypes.length > 0 ||
        selectedBrandId ||
        selectedModelId ||
        getUrlParams("category").length > 0
    ) {
        applyButton.style.display = "flex"; // Делаем кнопку видимой
    }
});
