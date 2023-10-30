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

function _switchTab(event, tabName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}

_imageSlider()