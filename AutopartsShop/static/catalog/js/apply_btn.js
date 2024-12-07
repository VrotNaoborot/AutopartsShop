document.addEventListener("DOMContentLoaded", () => {
    const applyButton = document.querySelector(".apply-btn");

    applyButton.addEventListener("click", () => {
        const marksFilter = document.querySelector("#marks .choices__item[data-id]");
        const modelsFilter = document.querySelector("#models .choices__item[data-id]");
        const categoriesFilter = document.querySelector("#categories .choices__item[data-id]");

        const partsCheckbox = document.querySelector("#filter-part");
        const accessoryCheckbox = document.querySelector("#filter-accessory");

        const params = new URLSearchParams();

        // Проверяем и добавляем параметры фильтров
        if (marksFilter && marksFilter.getAttribute("data-id") !== "-1") {
            params.append("mark", marksFilter.getAttribute("data-id"));
        }

        if (modelsFilter && modelsFilter.getAttribute("data-id") !== "-1") {
            params.append("model", modelsFilter.getAttribute("data-id"));
        }

        if (categoriesFilter && categoriesFilter.getAttribute("data-id") !== "-1") {
            params.append("category", categoriesFilter.getAttribute("data-id"));
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
