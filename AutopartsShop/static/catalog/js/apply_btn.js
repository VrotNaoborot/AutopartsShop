document.addEventListener("DOMContentLoaded", () => {
    const applyButton = document.querySelector(".apply-btn");

    applyButton.addEventListener("click", () => {
        // Получаем выбранные значения
        const marksFilter = document.querySelector("#marks .choices__list--single .choices__item[data-id]:not([data-id='-1'])");
        const modelsFilter = document.querySelector("#models .choices__list--single .choices__item[data-id]:not([data-id='-1'])");
        const categoriesFilter = document.querySelector("#categories .choices:nth-of-type(1) .choices__list--single .choices__item[data-id]:not([data-id='-1'])");
        const subcategoriesFilter = document.querySelector("#categories .choices:nth-of-type(2) .choices__list--single .choices__item[data-id]:not([data-id='-1'])");

        const partsCheckbox = document.querySelector("#filter-part");
        const accessoryCheckbox = document.querySelector("#filter-accessory");

        const params = new URLSearchParams();

        // Добавляем параметры фильтров, если они выбраны
        if (marksFilter) {
            const markId = marksFilter.getAttribute("data-id");
            params.append("mark", markId);
        }

        if (modelsFilter) {
            const modelId = modelsFilter.getAttribute("data-id");
            params.append("model", modelId);
        }

        if (categoriesFilter) {
            const categoryId = categoriesFilter.getAttribute("data-id");
            params.append("category", categoryId);
        }

        if (subcategoriesFilter) {
            const subcategoryId = subcategoriesFilter.getAttribute("data-id");
            params.append("subcategory", subcategoryId);
            console.log(subcategoryId);
        }

        // Проверяем и добавляем состояние чекбоксов
        if (partsCheckbox && partsCheckbox.checked) {
            params.append("type", "parts");
        }

        if (accessoryCheckbox && accessoryCheckbox.checked) {
            params.append("type", "accessory");
        }

        // Перенаправление на страницу каталога с параметрами
        const queryString = params.toString();
        const url = queryString ? `/catalog/?${queryString}` : `/catalog/`;
        window.location.href = url;
    });
});
