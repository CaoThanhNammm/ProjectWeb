package model;

public class VerifyEmail {
	private String code;
	private Account ac;

	/**
	 * @param code
	 * @param ac
	 */
	public VerifyEmail(String code, Account ac) {
		this.code = code;
		this.ac = ac;
	}

	public boolean isCode(String input) {
		// TODO Auto-generated method stub
		return this.code.equals(input);
	}

	/**
	 * @return the ac
	 */
	public Account getAc() {
		return ac;
	}

}
