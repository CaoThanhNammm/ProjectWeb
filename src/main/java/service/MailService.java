package service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.Encrypt;

/**
 * Create: Nguyễn Khải Nam Date: 27/11/2023 Note: Thực hiện các công việc liên
 * quan đến mail
 */
public class MailService {
	// Tài khoản phải bất xác thực 2 lớp và cho phép truy cập mật khẩu tự động
	private static final String adminMail = "ltwgroup23@gmail.com";
	private static final String adminPass = "bvzp jdaf jubo yjis";

	// Nội dung trả về chính là mã code phải nhập
	public static String sendEmail(String toEmail, String subject, String mess, String c) {
		String code = (c == null ? Encrypt.generateCode(6) : c);
		try {
			// Cấu hình các thuộc tính cho việc gửi email thông qua Gmail
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");

			// Tạo một phiên gửi email
			Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(adminMail, adminPass);
				}
			});

			try {
				// Tạo đối tượng MimeMessage
				Message message = new MimeMessage(session);

				// Đặt địa chỉ email người gửi
				message.setFrom(new InternetAddress(adminMail));

				// Đặt địa chỉ email người nhận
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

				// Đặt chủ đề email
				message.setSubject(subject);

				// Đặt nội dung email
				message.setText(mess + code);

				// Gửi email
				Transport.send(message);

			} catch (MessagingException e) {
				e.printStackTrace();
				System.out.println("[MailService-sendEmail] >> Có lỗi trong quá trình gửi");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("[MailService-sendEmail] >> Có lỗi trong tài khoản");
		}
		return code;
	}

}