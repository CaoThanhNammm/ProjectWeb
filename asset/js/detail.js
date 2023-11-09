// JavaScript cho phần hình ảnh
function _imageSlider() {
    var images = document.querySelectorAll('.slider_image');
    var mainImage = document.querySelector('.slider_main img');

    images.forEach((image, index) => {
        image.addEventListener('click', () => {
            images.forEach((img) => img.classList.remove('active'));
            image.classList.add('active');
            mainImage.src = image.src;
        });
    });
}

_imageSlider()