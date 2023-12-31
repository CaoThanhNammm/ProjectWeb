document.addEventListener('DOMContentLoaded', function () {
    slideTopToBottom();
})

var elementNavItem = document.querySelectorAll(".nav-item");

function slideTopToBottom() {
    elementNavItem.forEach(function (value, index) {
        var elementNavlink = value.querySelector(".nav-link");
        var elementNavlinkChild = value.querySelector(".nav-item_list_child");

        if (elementNavlink) {
            elementNavlink.onclick = function () {
                elementNavlinkChild.classList.toggle("active_child");
            }
        }
    })
}

