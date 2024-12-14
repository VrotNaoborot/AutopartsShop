document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.querySelector("header .search input");
    const searchResults = document.createElement("div");
    searchResults.className = "search-results";
    document.querySelector("header .search").appendChild(searchResults);

    searchInput.addEventListener("input", async function () {
        const query = this.value.trim();

        if (query.length === 0) {
            searchResults.innerHTML = "";
            searchResults.classList.remove("show");
            return;
        }

        const results = await fetchSearchResults(query);

        if (results.length > 0) {
            renderResults(results);
        } else {
            searchResults.innerHTML = "<div>Ничего не найдено</div>";
            searchResults.classList.add("show");
        }
    });

    function renderResults(results) {
        searchResults.innerHTML = ""; // Очищаем предыдущие результаты

        // Получаем URL с плейсхолдером из HTML
        const cardProductUrlTemplate = document.getElementById("card-product-url").dataset.url;

        results.forEach((result) => {
            const item = document.createElement("div");
            item.textContent = result.name; // Имя товара
            item.dataset.id = result.id; // ID товара
            item.addEventListener("click", () => {
                // Заменяем плейсхолдер на ID товара
                const productUrl = cardProductUrlTemplate.replace("0", result.id);
                window.location.href = productUrl; // Переход на страницу товара
            });
            searchResults.appendChild(item);
        });

        searchResults.classList.add("show");
    }


    // Закрываем выпадающий список, если клик не по нему
    document.addEventListener("click", (e) => {
        if (!e.target.closest(".search")) {
            searchResults.classList.remove("show");
        }
    });

    async function fetchSearchResults(query) {
        const response = await fetch(`search/?q=${query}`);
        if (response.ok) {
            return await response.json();
        } else {
            console.error("Ошибка запроса:", response.statusText);
            return [];
        }
    }
});
