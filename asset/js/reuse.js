document.addEventListener('DOMContentLoaded', function () {
    _generateHeaderAndFooter()
})

/*
    Tạo bởi: Trần Minh Quân
    Ngày: 20/10/2023
    Tác dụng: Tự động chèn header và footer vào trang web
*/
function _generateHeaderAndFooter() {
<<<<<<< HEAD
    let body = document.querySelector("body");
=======
    body = document.querySelector("body");
    body.innerHTML = "<header></header>" + body.innerHTML
    body.innerHTML += "<footer></footer>"
>>>>>>> master

    fetch('/asset/html/header.html')
        .then(response => response.text())
        .then(data => {
<<<<<<< HEAD
            const header = document.createElement('header');
            // Tạo một div tạm thời để chứa nội dung và loại bỏ thẻ meta và title
            const tempDiv = document.createElement('div');
            tempDiv.innerHTML = data;
            // Loại bỏ thẻ meta và title
            tempDiv.querySelectorAll('meta, title').forEach(element => element.remove());
            // Đặt lại nội dung của header
            header.innerHTML = tempDiv.innerHTML;
            body.prepend(header);
=======
            document.querySelector('header').innerHTML = data;
>>>>>>> master
        });

    fetch('/asset/html/footer.html')
        .then(response => response.text())
        .then(data => {
<<<<<<< HEAD
            const footer = document.createElement('footer');
            // Tạo một div tạm thời để chứa nội dung và loại bỏ thẻ meta và title
            const tempDiv = document.createElement('div');
            tempDiv.innerHTML = data;
            // Loại bỏ thẻ meta và title
            tempDiv.querySelectorAll('meta, title').forEach(element => element.remove());
            // Đặt lại nội dung của footer
            footer.innerHTML = tempDiv.innerHTML;
            body.appendChild(footer);
        });
}
=======
            document.querySelector('footer').innerHTML = data;
        });
}
>>>>>>> master
