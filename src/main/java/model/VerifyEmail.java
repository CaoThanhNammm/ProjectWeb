package model;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class VerifyEmail {
	private String code;
	private Account ac;
	private long time;
	private LocalDateTime oldTime;

	/**
	 * @param code
	 * @param ac
	 */
	public VerifyEmail(String code, Account ac, long time) {
		this.code = code;
		this.ac = ac;
		this.time = time;
		this.oldTime = LocalDateTime.now();
	}

	public boolean isCode(String input) {
		// TODO Auto-generated method stub
		if(Duration.between(oldTime, LocalDateTime.now()).getSeconds() >= time) {
			code = "%?@#$*!";
		}
		return this.code.equals(input);
	}

	/**
	 * @return the ac
	 */
	public Account getAc() {
		return ac;
	}
	
	public static void main(String[] args) throws InterruptedException {
		LocalDateTime oldTime = LocalDateTime.now();
		System.out.println(oldTime);
		Thread.sleep(1000);
		LocalDateTime now = LocalDateTime.now();
		System.out.println(now);
		System.out.println(Duration.between(oldTime, now).getSeconds());
	}

}
