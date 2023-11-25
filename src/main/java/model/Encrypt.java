package model;

import java.security.MessageDigest;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class Encrypt {
	private static final String SECRET_KEY = "ThisIsASecretKey";
	private static final String ALGORITHM_AES = "AES";
	private static final String ALGORITHM_SHA256 = "SHA-256";

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

			return Base64.getEncoder().encodeToString(hashBytes);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}