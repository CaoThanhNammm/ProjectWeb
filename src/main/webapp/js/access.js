/**
 * Create: Nguyễn Khải Nam
 * Date: 16/11/2023
 * Note: Bắt sự kiện của đăng nhập, đăng ký, quên mật khẩu
 */

function verifyEmail() {
    let verificationCode = '';

        while (verificationCode.length !== 6) {
            verificationCode = prompt('Vui lòng nhập mã được gửi về Gmail', 'Đoạn mã gồm 6 số');

            if (verificationCode === null) {
                // Người dùng nhấn Cancel
                return null;
            }

            if (verificationCode.length !== 6) {
                alert('Mã xác minh phải gồm 6 số. Vui lòng nhập lại.');
            }
        }

        // Gửi mã xác minh qua AJAX
        $.ajax({
            type: 'POST',
            url: '/access',
            data: { verificationCode: verificationCode },
            success: function(response) {
                // Xử lý phản hồi từ servlet (nếu cần)
                console.log(response);
            },
            error: function(error) {
                // Xử lý lỗi (nếu cần)
                console.error(error);
            }
        });
}