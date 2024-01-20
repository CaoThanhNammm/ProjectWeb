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

function _optionSwitch() {
    var options = document.querySelectorAll('.detail .choices .choice');
    var forms = document.querySelectorAll('.detail .checkout form');
    var buy_form = forms[0]
    var cart_form = forms[1]

    options.forEach((option, index) => {
        option.addEventListener('click', () => {
            options.forEach((opt) => opt.classList.remove('actived'));
            option.classList.add('actived');
            buy_form.action = option.id
            cart_form.action = "cart?method=add&id=" + option.id
        });
    });
}

_imageSlider()
_optionSwitch()