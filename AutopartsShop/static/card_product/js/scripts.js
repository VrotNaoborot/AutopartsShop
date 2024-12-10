document.addEventListener('DOMContentLoaded', function () {
  // Получаем элемент
  const productAction = document.querySelector('.product-action');

  // Если элемент не найден, прекращаем выполнение
  if (!productAction) {
    return;
  }

  // Функция для получения абсолютных координат элемента
  function getAbsolutePosition(element) {
    const rect = element.getBoundingClientRect();
    const scrollTop = window.scrollY || document.documentElement.scrollTop;
    const scrollLeft = window.scrollX || document.documentElement.scrollLeft;
    return {
      top: rect.top + scrollTop,
      left: rect.left + scrollLeft
    };
  }

  // Сохраняем начальную ширину элемента
  const initialWidth = productAction.offsetWidth;

  // Получаем начальные абсолютные координаты для product-action
  let position = getAbsolutePosition(productAction);
  let originalTop = position.top;

  // Добавляем обработчик события scroll
  window.addEventListener('scroll', function() {
    // Пересчитываем абсолютные координаты
    position = getAbsolutePosition(productAction);

    // Если страница прокручена больше начальной позиции, меняем top
    if (window.scrollY > originalTop) {
      productAction.style.position = 'fixed';  // Меняем на fixed, чтобы элемент оставался на экране
      productAction.style.top = '20px';  // Устанавливаем фиксированную высоту сверху (можно подкорректировать)
      productAction.style.left = position.left + 'px';  // Сохраняем исходное положение слева
      productAction.style.width = initialWidth + 'px';  // Устанавливаем ширину, как у исходного элемента
    } else {
      // Если прокрутка меньше, просто возвращаем элемент в его исходное положение
      productAction.style.position = '';  // Убираем position (оставляем его как было в исходном состоянии)
      productAction.style.top = '';  // Убираем top
      productAction.style.left = '';  // Убираем left
      productAction.style.width = '';  // Сбрасываем ширину
    }
  });
});
