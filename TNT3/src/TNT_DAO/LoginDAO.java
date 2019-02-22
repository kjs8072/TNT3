package TNT_DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import TNT_Bean.LoginBean;

public class LoginDAO {

	Connection conn;
	PreparedStatement pstmt;

	String jdbc_dirver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@192.168.0.24:1521:TNT";
	void connect() {
		try {
			Class.forName(jdbc_dirver);
			conn = DriverManager.getConnection(jdbc_url, "admin", "admin");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean funcStaff(String id, String pw) {
		connect();
		CallableStatement cs;
		String sql = "{? = call staff_login_check(?, ?)}";
		int result=0;
		
		try {
			cs = conn.prepareCall(sql);
			cs.registerOutParameter(1, java.sql.Types.INTEGER);
			cs.setString(2, id);
			cs.setString(3, pw); // ������ password ��
			cs.execute();
			result = cs.getInt(1);
			cs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		if(result > 0)
			return true;
		else
			return false;

	}

	public boolean funcStudent(String id, String pw) {
		connect();
		CallableStatement cs;
		String sql = "{? = call log_in_check(?, ?)";
		int result=0;
		try {
			cs = conn.prepareCall(sql);
			cs.registerOutParameter(1, java.sql.Types.INTEGER);
			cs.setString(2, id);
			cs.setString(3, pw); // �л� password ��
			cs.execute();
			result = cs.getInt(1);
//			System.out.println(cs.getInt(1) + " => success ");
			cs.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		if(result > 0)
			return true;
		else
			return false;
	}

	public ArrayList<LoginBean> studentDBselect(String id, String pwd) {
		connect();
		String sql = "select * from students ";
		ArrayList<LoginBean> login = new ArrayList<>();
		LoginBean bean = null;

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new LoginBean();
				bean.setUserid(id);
				bean.setPasswd(pwd);

				login.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return login;

	}

	public boolean studentsDBinsert(LoginBean loginbean) {
		connect();
		String sql = "insert into students (student_id, student_pass)" + "values(?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginbean.getUserid());
			pstmt.setString(2, loginbean.getPasswd());

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public boolean staffsDBinsert(LoginBean loginbean) {
		connect();
		String sql = "insert into staffs (staff_id, staff_pass)" + "values(?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginbean.getUserid());
			pstmt.setString(2, loginbean.getPasswd());

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

}
