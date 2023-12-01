package dao;

import static database.TableUsers.EMAIL;
import static database.TableUsers.*;
import static database.TableUsers.PASSWORD;

import java.time.LocalDate;
import java.util.List;

import org.jdbi.v3.core.Jdbi;

import database.JDBIConnector;
import model.Account;
import model.Encrypt;

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
		try {
			ac = connect.withHandle(h -> {
				String prefix = name.substring(0, name.indexOf("-") + 1);
				String name2 = name.replace(prefix, "");
				prefix = prefix.replace("-", "").toLowerCase();
				return h.createQuery("SELECT " + ID + ", " + FULL_NAME + ", " + ROLE + ", " + STATUS + " FROM "
						+ NAME_TABLE + " WHERE " + prefix + "=:name" + " AND " + PASSWORD + "=:password")
						.bind("name", name2).bind("password", Encrypt.encrypt(password))
						.map((rs, ctx) -> new Account(rs.getString(ID), rs.getString(FULL_NAME), rs.getInt(ROLE),
								rs.getInt(STATUS)))
						.findOne().orElse(null);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ac;

	}

	// Kiểm tra có tồn tại tài khoản
	public static boolean hasAccount(final String id, final String email, final String phone) {
		Account ac = null;
		try {
			ac = connect.withHandle(h -> {
				return h.createQuery("SELECT " + ID + " FROM " + NAME_TABLE + " WHERE " + EMAIL + "=:email" + " OR "
						+ PHONE + "=:phone" + " OR " + ID + "=:id").bind("id", id).bind("email", email)
						.bind("phone", phone).mapToBean(Account.class).findOne().orElse(null);
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ac != null;
	}

	public synchronized static int insertAccount(Account ac) {
		// TODO Auto-generated method stub
		int count = connect.withHandle(h -> {
			return h.execute("INSERT INTO " + NAME_TABLE + " VALUES (?,?,?,?,?,?,?,?,?,?)", ac.getId(), ac.getEmail(),
					ac.getPhone(), Encrypt.encrypt(ac.getPass()), ac.getFullName(), ac.getGender(), ac.getDob(),
					ac.getRole(), ac.getAddress(), ac.getStatus());
		});
		return count;
	}

	// Kiểm tra giới tính
	public static int isGender(String gender) {
		// TODO Auto-generated method stub
		int count = 1;
		switch (gender) {
		case "freeMale":
			count = 2;
			break;
		case "other":
			count = 3;
			break;
		default:
			count = 1;
			break;
		}
		return count;
	}

	// Cập nhật thông tin một cột bất kỳ
	public static boolean updateAccount(String email, String field, String pass) {
		// TODO Auto-generated method stub
		return connect.withHandle(h -> {
			return h.execute("UPDATE " + NAME_TABLE + " SET " + field + "=? WHERE " + EMAIL + "=?", pass, email) > 0;
		});
	}

}