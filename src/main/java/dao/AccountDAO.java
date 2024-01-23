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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.jdbi.v3.core.Handle;

import database.JDBIConnectionPool;
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

	// lấy ra tất cả user có trong DB
	public static List<Account> getAll() throws SQLException {
		Handle h = JDBIConnectionPool.get().getConnection();
		Connection conn = h.getConnection();

		String sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName FROM users u JOIN role_user r ON u.roleID = r.id "
				+ "JOIN user_status us ON u.statusID = us.id JOIN genders g ON g.id = u.genderID";
		PreparedStatement st = conn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		List<Account> accs = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString("id");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String fullname = rs.getString("fullname");
			String address = rs.getString("address");
			int roleID = rs.getInt("roleID");
			String roleName = rs.getString("roleName");
			int statusID = rs.getInt("statusID");
			String statusName = rs.getString("statusName");
			int genderID = rs.getInt("genderID");
			String genderName = rs.getString("genderName");

			Account acc = new Account(id, email, phone, fullname, address, new Gender(genderID, genderName),
					new AccountRole(roleID, roleName), new AccountStatus(statusID, statusName));
			accs.add(acc);
		}
		JDBIConnectionPool.get().releaseConnection(h);

		return accs;
	}

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

	public static List<Account> findUserByEmail(String email) throws SQLException {
		Handle h = JDBIConnectionPool.get().getConnection();
		String sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName "
				+ "FROM users u JOIN role_user r ON u.roleID = r.id " + "JOIN user_status us ON u.statusID = us.id "
				+ "JOIN genders g ON g.id = u.genderID " + "WHERE u.email like ? ";
		Connection conn = h.getConnection();

		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%" + email + "%");
		ResultSet rs = st.executeQuery();
		List<Account> accs = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString("id");
			String email1 = rs.getString("email");
			String phone = rs.getString("phone");
			String fullname = rs.getString("fullname");
			String address = rs.getString("address");
			int roleID = rs.getInt("roleID");
			String roleName = rs.getString("roleName");
			int statusID = rs.getInt("statusID");
			String statusName = rs.getString("statusName");
			int genderID = rs.getInt("genderID");
			String genderName = rs.getString("genderName");

			Account acc = new Account(id, email1, phone, fullname, address, new Gender(genderID, genderName),
					new AccountRole(roleID, roleName), new AccountStatus(statusID, statusName));
			accs.add(acc);
		}
		JDBIConnectionPool.get().releaseConnection(h);

		return accs;
	}

	public static List<Account> findUserByPhone(String phone) throws SQLException {
		Handle h = JDBIConnectionPool.get().getConnection();
		String sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName "
				+ "FROM users u JOIN role r ON u.roleID = r.id " + "JOIN user_status us ON u.statusID = us.id "
				+ "JOIN genders g ON g.id = u.genderID " + "WHERE u.phone like ? ";
		Connection conn = h.getConnection();

		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%" + phone + "%");
		ResultSet rs = st.executeQuery();
		List<Account> accs = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString("id");
			String email = rs.getString("email");
			String phone1 = rs.getString("phone");
			String fullname = rs.getString("fullname");
			String address = rs.getString("address");
			int roleID = rs.getInt("roleID");
			String roleName = rs.getString("roleName");
			int statusID = rs.getInt("statusID");
			String statusName = rs.getString("statusName");
			int genderID = rs.getInt("genderID");
			String genderName = rs.getString("genderName");

			Account acc = new Account(id, email, phone1, fullname, address, new Gender(genderID, genderName),
					new AccountRole(roleID, roleName), new AccountStatus(statusID, statusName));
			accs.add(acc);
		}
		JDBIConnectionPool.get().releaseConnection(h);

		return accs;
	}

	public static List<Account> findUserByName(String name) throws SQLException {
		Handle h = JDBIConnectionPool.get().getConnection();
		String sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName "
				+ "FROM users u JOIN role r ON u.roleID = r.id " + "JOIN user_status us ON u.statusID = us.id "
				+ "JOIN genders g ON g.id = u.genderID " + "WHERE u.fullname like ? ";
		Connection conn = h.getConnection();

		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%" + name + "%");
		ResultSet rs = st.executeQuery();
		List<Account> accs = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString("id");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String fullname = rs.getString("fullname");
			String address = rs.getString("address");
			int roleID = rs.getInt("roleID");
			String roleName = rs.getString("roleName");
			int statusID = rs.getInt("statusID");
			String statusName = rs.getString("statusName");
			int genderID = rs.getInt("genderID");
			String genderName = rs.getString("genderName");

			Account acc = new Account(id, email, phone, fullname, address, new Gender(genderID, genderName),
					new AccountRole(roleID, roleName), new AccountStatus(statusID, statusName));
			accs.add(acc);
		}
		JDBIConnectionPool.get().releaseConnection(h);

		return accs;
	}

	public static List<Account> find(String email, String phone, String name) throws SQLException {
		Handle h = JDBIConnectionPool.get().getConnection();
		String sql = "";
		PreparedStatement st = null;
		Connection conn = null;

		if (email.equals("")) {
			sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName "
					+ "FROM users u JOIN role r ON u.roleID = r.id " + "JOIN user_status us ON u.statusID = us.id "
					+ "JOIN genders g ON g.id = u.genderID " + "WHERE u.fullname like ? and u.phone like ?";
			conn = h.getConnection();

			st = conn.prepareStatement(sql);
			st.setString(1, "%" + name + "%");
			st.setString(2, "%" + phone + "%");

		} else if (phone.equals("")) {
			sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName "
					+ "FROM users u JOIN role r ON u.roleID = r.id " + "JOIN user_status us ON u.statusID = us.id "
					+ "JOIN genders g ON g.id = u.genderID " + "WHERE u.email like ? and u.fullname like ?";
			conn = h.getConnection();

			st = conn.prepareStatement(sql);
			st.setString(1, "%" + email + "%");
			st.setString(2, "%" + name + "%");
		} else if (name.equals("")) {
			sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName "
					+ "FROM users u JOIN role r ON u.roleID = r.id " + "JOIN user_status us ON u.statusID = us.id "
					+ "JOIN genders g ON g.id = u.genderID " + "WHERE u.email like ? and u.phone like ?";
			conn = h.getConnection();

			st = conn.prepareStatement(sql);
			st.setString(1, "%" + email + "%");
			st.setString(2, "%" + phone + "%");
		} else {
			sql = "SELECT u.id, u.email, u.phone, u.fullname, u.address, r.id as roleID, r.name as roleName, us.id as statusID, us.name as statusName, g.id as genderID, g.name as genderName "
					+ "FROM users u JOIN role r ON u.roleID = r.id " + "JOIN user_status us ON u.statusID = us.id "
					+ "JOIN genders g ON g.id = u.genderID "
					+ "WHERE u.email like ? and u.phone like ? and u.fullname like ?";
			conn = h.getConnection();

			st = conn.prepareStatement(sql);
			st.setString(1, "%" + email + "%");
			st.setString(2, "%" + phone + "%");
			st.setString(3, "%" + name + "%");
		}

		ResultSet rs = st.executeQuery();
		List<Account> accs = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString("id");
			String email1 = rs.getString("email");
			String phone1 = rs.getString("phone");
			String fullname = rs.getString("fullname");
			String address = rs.getString("address");
			int roleID = rs.getInt("roleID");
			String roleName = rs.getString("roleName");
			int statusID = rs.getInt("statusID");
			String statusName = rs.getString("statusName");
			int genderID = rs.getInt("genderID");
			String genderName = rs.getString("genderName");

			Account acc = new Account(id, email1, phone1, fullname, address, new Gender(genderID, genderName),
					new AccountRole(roleID, roleName), new AccountStatus(statusID, statusName));
			accs.add(acc);
		}

		JDBIConnectionPool.get().releaseConnection(h);
		return accs;
	}

	// tính tổng số user
	public static int totalUser() {
		Handle h = JDBIConnectionPool.get().getConnection();
		List<Account> accs = h.select("SELECT id FROM users").mapToBean(Account.class).list();
		JDBIConnectionPool.get().releaseConnection(h);
		return accs.size();
	}

	// tính số user vẫn còn hoạt động(chưa bị khóa)
	public static int countUserAvailable() {
		Handle h = JDBIConnectionPool.get().getConnection();
		List<Account> accs = h.select("SELECT id FROM users WHERE statusID = 2").mapToBean(Account.class).list();
		JDBIConnectionPool.get().releaseConnection(h);
		return accs.size();
	}

	// tính số user bị khóa acc
	public static int countUserUnAvailable() {
		Handle h = JDBIConnectionPool.get().getConnection();
		List<Account> accs = h.select("SELECT id FROM users WHERE statusID = 1").mapToBean(Account.class).list();
		JDBIConnectionPool.get().releaseConnection(h);
		return accs.size();
	}

}