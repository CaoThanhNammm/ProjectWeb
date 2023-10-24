function _linkHeaderFooterCSS() {
    head = document.querySelector("head");
    head.innerHTML += `
    <link rel="stylesheet" href="/asset/css/index.css">
    <link rel="stylesheet" href="/asset/css/header.css">
    <link rel="stylesheet" href="/asset/css/footer.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    `
}

/*
    Tạo bởi: Trần Minh Quân
    Ngày: 20/10/2023
    Tác dụng: Tự động chèn header và footer vào trang web
*/
function _generateHeaderAndFooter() {
    body = document.querySelector("body");
    body.innerHTML = "<header></header>" + body.innerHTML
    body.innerHTML += "<footer></footer>"

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

_linkHeaderFooterCSS()
_generateHeaderAndFooter()