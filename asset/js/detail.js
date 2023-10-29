// JavaScript cho phần hình ảnh
const images = document.querySelectorAll('.slider_image');
const mainImage = document.querySelector('.slider_main img');

images.forEach((image, index) => {
    image.addEventListener('click', () => {
        images.forEach((img) => img.classList.remove('active'));
        image.classList.add('active');
        mainImage.src = image.src;
    });
});