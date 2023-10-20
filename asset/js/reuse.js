/*
    Tạo bởi: Trần Minh Quân
    Ngày: 20/10/2023
    Tác dụng: Tự động chèn header và footer vào trang web
*/
function _generateHeaderAndFooter(){
    body = document.querySelector("body");
    body.innerHTML += "<header></header><footer></footer>"

    fetch('/asset/html/header.html')
    .then(response => response.text())
    .then(data => {
        document.querySelector('header').innerHTML = data;
    });

    fetch('/asset/html/footer.html')
    .then(response => response.text())
    .then(data => {
        document.querySelector('footer').innerHTML = data;
    });
}

_generateHeaderAndFooter()