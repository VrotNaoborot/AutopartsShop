document.addEventListener('DOMContentLoaded', () => {
    const filterContainer = document.getElementById('filter_container');
    const dropdownList = document.querySelector('.choices__list--dropdown');
    const selectElement = document.querySelector('.choices__input'); // <select> для обновления значения
    const selectedTextElement = document.querySelector('.choices__item--selectable'); // Элемент для отображения текущего выбора

    const modelDropdownList = document.querySelector('#models .choices__list--dropdown'); // Дополнительный выпадающий список для моделей
    const modelSelectElement = document.querySelector('#models .choices__input'); // <select> для обновления значения модели
    const modelSelectedTextElement = document.querySelector('#models .choices__item--selectable'); // Элемент для отображения выбранной модели

    const brandSelectElement = document.querySelector('#brands .choices__input'); // <select> для марок авто
    const modelsContainer = document.getElementById('models'); // Блок с моделями

    // Открытие/закрытие выпадающего списка при клике на фильтр
    filterContainer.addEventListener('click', (event) => {
        event.stopPropagation();
        const isExpanded = dropdownList.classList.toggle('is-active');
        dropdownList.setAttribute('aria-expanded', isExpanded ? 'true' : 'false');
    });

    // Открытие/закрытие выпадающего списка для моделей
    document.getElementById('models').addEventListener('click', (event) => {
        event.stopPropagation();
        const isExpanded = modelDropdownList.classList.toggle('is-active');
        modelDropdownList.setAttribute('aria-expanded', isExpanded ? 'true' : 'false');
    });

    // Обработка кликов по элементам списка марки
    const dropdownItems = dropdownList.querySelectorAll('.choices__item');
    dropdownItems.forEach(item => {
        item.addEventListener('click', (event) => {
            event.stopPropagation(); // Чтобы клик не вызвал повторное открытие списка

            // Обновление значения <select>
            const value = item.getAttribute('data-value');
            const text = item.textContent.trim();
            selectElement.innerHTML = `<option value="${value}" selected>${text}</option>`;
            selectedTextElement.textContent = text;

            // Закрытие выпадающего списка
            dropdownList.classList.remove('is-active');
            dropdownList.setAttribute('aria-expanded', 'false');

            // Показать блок с моделями, если выбрана марка
            // modelsContainer.style.display = 'block'; // Показываем блок с моделями
            fetchModelsByBrand(value);
        });

        // Добавляем hover-эффект
        item.addEventListener('mouseover', () => item.classList.add('is-highlighted'));
        item.addEventListener('mouseout', () => item.classList.remove('is-highlighted'));
    });

    // Обработка кликов по элементам списка для моделей
//    const modelDropdownItems = modelDropdownList.querySelectorAll('.choices__item');
//    modelDropdownItems.forEach(item => {
//        item.addEventListener('click', (event) => {
//            event.stopPropagation(); // Чтобы клик не вызвал повторное открытие списка
//
//            // Обновление значения <select> для модели
//            const value = item.getAttribute('data-value');
//            const text = item.textContent.trim();
//            modelSelectElement.innerHTML = `<option value="${value}" selected>${text}</option>`;
//            modelSelectedTextElement.textContent = text;
//
//            console.log('Модель выбрана');
//
//            // Закрытие выпадающего списка для моделей
//            modelDropdownList.classList.remove('is-active');
//            modelDropdownList.setAttribute('aria-expanded', 'false');
//        });
//
//    });

    // Закрытие выпадающего списка при клике вне контейнера фильтра
    document.addEventListener('click', (event) => {
        if (!filterContainer.contains(event.target)) {
            dropdownList.classList.remove('is-active');
            dropdownList.setAttribute('aria-expanded', 'false');
        }
        // Закрытие выпадающего списка для моделей, если клик вне модели
        if (!document.getElementById('models').contains(event.target)) {
            modelDropdownList.classList.remove('is-active');
            modelDropdownList.setAttribute('aria-expanded', 'false');
        }
    });

    function fetchModelsByBrand(brandId) {
        // Находим элементы, с которыми будем работать
        const modelsContainer = document.getElementById('models'); // Блок с моделями
        const modelDropdownList = document.querySelector('#models .choices__list--dropdown'); // Выпадающий список моделей

        // Отправляем запрос на сервер для получения моделей для выбранной марки
        fetch(`/get-models/${brandId}/`)
            .then(response => {
                // Проверяем, что ответ успешный (код 200)
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Очистка списка моделей
                modelDropdownList.innerHTML = '';

                // Проверяем, если в ответе есть массив моделей
                if (Array.isArray(data) && data.length > 0) {
                    // Добавляем модели в выпадающий список
                    data.forEach(model => {
                        const modelItem = document.createElement('div');
                        modelItem.classList.add('choices__item');
                        modelItem.classList.add('choices__item--selectable');
                        modelItem.setAttribute('data-value', model.id);
                        modelItem.textContent = model.name;

                         // Добавляем hover-эффект
                    modelItem.addEventListener('mouseover', () => {
                        modelItem.classList.add('is-highlighted');
                    });
                    modelItem.addEventListener('mouseout', () => {
                        modelItem.classList.remove('is-highlighted');
                    });

                    // Добавляем обработчик клика по модели
                    modelItem.addEventListener('click', () => {
                        // Обновление значения <select>
                        modelSelectElement.innerHTML = `<option value="${model.id}" selected>${model.name}</option>`;

                        // Обновляем отображаемый текст
                        modelSelectedTextElement.textContent = model.name;



                    });
                        // Закрытие выпадающего списка для моделей
                        modelDropdownList.classList.remove('is-active');
                        modelDropdownList.setAttribute('aria-expanded', 'false');

                        modelDropdownList.appendChild(modelItem);
                    });

                    // Показываем блок с моделями
                    modelsContainer.style.display = 'block';
                } else {
                    console.error('No models found in the response.');
                    modelsContainer.style.display = 'none'; // Прячем блок с моделями, если их нет
                }
            })
            .catch(error => {
                console.error('Error fetching models:', error);
                modelsContainer.style.display = 'none'; // Прячем блок моделей при ошибке
            });
    }



});
