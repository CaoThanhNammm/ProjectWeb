package dao;

import static database.TableUsers.ADDRESS;
import static database.TableUsers.DOB;
import static database.TableUsers.EMAIL;
import static database.TableUsers.FULL_NAME;
import static database.TableUsers.GENDER;
import static database.TableUsers.ID;
import static database.TableUsers.NAME_TABLE;
import static database.TableUsers.PASSWORD;
import static database.TableUsers.PHONE;
import static database.TableUsers.ROLE;
import static database.TableUsers.STATUS;

import java.util.regex.Pattern;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import database.JDBIConnectionPool;
import database.JDBIConnector;
import model.Account;
import model.AccountRole;
import model.AccountStatus;
import model.Encrypt;
import model.Gender;

/**
 * Create: Nguyễn Khải Nam Note: Thực hiện các công việc liên quan đến user
 * Date: 25/11/2023
 */
public class AccountDAO {
	public static final Jdbi connect = JDBIConnector.getConnection();

	// Tạo ra id của account
	public synchronized static String generateID(String email, String phone) {
		return Encrypt.encrypt(email + phone).substring(0, 20);
	}

	// Lấy ra tài khoản nếu tồn tại
	public synchronized static Account getAccount(final String name, final String password) {
		Account ac = null;
		Handle h = JDBIConnectionPool.get().getConnection();
		String prefix = name.substring(0, name.indexOf("-") + 1);
		String name2 = name.replace(prefix, "");
		prefix = prefix.replace("-", "").toLowerCase();
		ac = h.createQuery("SELECT " + ID + ", " + FULL_NAME + ", " + ROLE + ", " + STATUS + " FROM " + NAME_TABLE
				+ " WHERE " + prefix + "=:name" + " AND " + PASSWORD + "=:password").bind("name", name2)
				.bind("password", Encrypt.encrypt(password))
				.map((rs, ctx) -> new Account(rs.getString(ID), rs.getString(FULL_NAME),
						AccountRole.getRole(rs.getInt(ROLE)), AccountStatus.getStatus(rs.getInt(STATUS))))
				.findOne().orElse(null);
		JDBIConnectionPool.get().releaseConnection(h);
		return ac;

	}

	// Kiểm tra có tồn tại tài khoản
	public static boolean hasAccount(final String id, final String email, final String phone) {
		Account ac = null;
		Handle h = JDBIConnectionPool.get().getConnection();
		ac = h.createQuery("SELECT " + ID + " FROM " + NAME_TABLE + " WHERE " + EMAIL + "=:email" + " OR " + PHONE
				+ "=:phone" + " OR " + ID + "=:id").bind("id", id).bind("email", email).bind("phone", phone)
				.mapToBean(Account.class).findOne().orElse(null);
		JDBIConnectionPool.get().releaseConnection(h);
		return ac != null;
	}

	public synchronized static int insertAccount(Account ac) {
		// TODO Auto-generated method stub
		Handle h = JDBIConnectionPool.get().getConnection();
		int count = h.execute("INSERT INTO " + NAME_TABLE + " VALUES (?,?,?,?,?,?,?,?,?,?)", ac.getId(), ac.getEmail(),
				ac.getPhone(), Encrypt.encrypt(ac.getPass()), ac.getFullName(), ac.getGender().getId(), ac.getDob(),
				ac.getRole().getId(), ac.getAddress(), ac.getStatus().getId());
		JDBIConnectionPool.get().releaseConnection(h);
		return count;
	}

	// Cập nhật thông tin một cột bất kỳ
	public synchronized static boolean updateAccount(String field, String value, String fieldChange,
			String valueChange) {
		// TODO Auto-generated method stub
		Handle h = JDBIConnectionPool.get().getConnection();
		boolean check = h.execute("UPDATE " + NAME_TABLE + " SET " + fieldChange + "=? WHERE " + field + "=?",
				valueChange, value) > 0;
		JDBIConnectionPool.get().releaseConnection(h);
		return check;
	}

	// Lấy thêm một số thông tin của người dùng
	public synchronized static Account getMoreInfo(Account ac) {
		// TODO Auto-generated method stub
		Account acInfo = null;
		if (ac != null) {
			Handle h = JDBIConnectionPool.get().getConnection();
			acInfo = h
					.createQuery("SELECT " + EMAIL + ", " + PHONE + ", " + FULL_NAME + ", " + GENDER + ", " + DOB + ", "
							+ ADDRESS + " FROM " + NAME_TABLE + " WHERE " + ID + "=:id")
					.bind("id", ac.getId())
					.map((rs, ctx) -> new Account(rs.getString(EMAIL), rs.getString(PHONE), rs.getString(FULL_NAME),
							Gender.getGender(rs.getInt(GENDER)), rs.getDate(DOB).toLocalDate(), rs.getString(ADDRESS)))
					.findOne().orElse(null);
			JDBIConnectionPool.get().releaseConnection(h);
		}
		return acInfo;
	}

	// Kiểm tra có là số điện thoại
	public static boolean isPhoneNumber(String phone) {
		return Pattern.compile("^\\d{10}$").matcher(phone).matches();
	}

	// Kiểm tra có là email
	public static boolean isEmail(String email) {
		return Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
				.matcher(email).matches();
	}

}