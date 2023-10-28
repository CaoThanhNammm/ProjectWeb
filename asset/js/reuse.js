function _linkHeaderFooterCSS() {
    head = document.querySelector("head");
    head.innerHTML = `
    <link rel="stylesheet" href="/asset/css/index.css">
    <link rel="stylesheet" href="/asset/css/header.css">
    <link rel="stylesheet" href="/asset/css/footer.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    `
        + head.innerHTML;
}

/*
    Tạo bởi: Trần Minh Quân
    Ngày: 20/10/2023
    Tác dụng: Tự động chèn header và footer vào trang web
*/
function _generateHeaderAndFooter() {
    body = document.querySelector("body");

    fetch('/asset/html/header.html')
        .then(response => response.text())
        .then(data => {

            const header = document.createElement('header');
            // Tạo một div tạm thời để chứa nội dung và loại bỏ thẻ meta và title
            const tempDiv = document.createElement('div');
            tempDiv.innerHTML = data;
            // Loại bỏ thẻ meta và title
            tempDiv.querySelectorAll('meta, title').forEach(element => element.remove());
            // Đặt lại nội dung của header
            header.innerHTML = tempDiv.innerHTML;
            body.prepend(header);
        });

    fetch('/asset/html/footer.html')
        .then(response => response.text())
        .then(data => {

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
<<<<<<< HEAD
=======

_linkHeaderFooterCSS()
_generateHeaderAndFooter()
>>>>>>> master
