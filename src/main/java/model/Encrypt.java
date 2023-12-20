package model;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 * Create: Nguyễn Khải Nam Note: Dùng để mã hóa mật khẩu Date: 24/11/2023
 */
public class Encrypt {
	private static final String SECRET_KEY = "ThisIsASecretKey";
	private static final String ALGORITHM_AES = "AES";
	private static final String ALGORITHM_SHA256 = "SHA-256";
	private static final int MAX_LENGHT = 30;

	public static String encrypt(String input) {
		try {
			// Step 1: AES Encryption
			SecretKey key = new SecretKeySpec(SECRET_KEY.getBytes(), ALGORITHM_AES);
			Cipher cipher = Cipher.getInstance(ALGORITHM_AES);
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] encryptedBytes = cipher.doFinal(input.getBytes());

			// Step 2: SHA-256 Hashing
			MessageDigest sha256 = MessageDigest.getInstance(ALGORITHM_SHA256);
			byte[] hashBytes = sha256.digest(encryptedBytes);

			return Base64.getEncoder().encodeToString(hashBytes).substring(0, MAX_LENGHT);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String generateCode(int length) {
		String characterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

		if (length <= 0 || characterSet.isEmpty()) {
			throw new IllegalArgumentException("Invalid input parameters");
		}

		Random random = new Random();
		StringBuilder stringBuilder = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int randomIndex = random.nextInt(characterSet.length());
			char randomChar = characterSet.charAt(randomIndex);
			stringBuilder.append(randomChar);
		}

		return stringBuilder.toString();
	}
	
	public static void main(String[] args) {
		System.out.println(encrypt("admin@admin.com0123456789"));
		System.out.println(encrypt("1234567"));
	}
}
