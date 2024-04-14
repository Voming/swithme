package swithme.jdbc.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class JdbcTemplate {
	public JdbcTemplate() {
		
	}
	
	public static Connection getConnection(boolean isLocalhost) {
		Connection conn = null;
		Properties prop = new Properties();
		
		try {
			String currentPath = JdbcTemplate.class.getResource("./").getPath();
			prop.load(new FileReader(currentPath+"driver.properties"));
			Class.forName(prop.getProperty("jdbc.driver"));
			if(isLocalhost) {
				conn = DriverManager.getConnection(prop.getProperty("jdbc.swithme.localhost.url")
						, prop.getProperty("jbdc.swithme.username")
						, prop.getProperty("jbdc.swithme.password"));
			}else {
				conn = DriverManager.getConnection(prop.getProperty("jdbc.swithme.dbserver.url")
						, prop.getProperty("jbdc.swithme.username")
						, prop.getProperty("jbdc.swithme.password"));
			}
			if(conn!=null) System.out.println("연결성공"); else System.out.println("연결실패!!!!!!!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void autoCommit(Connection conn, boolean autocommit) {
		try {
			if (conn != null)
				conn.setAutoCommit(autocommit);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void Commit(Connection conn) {
		try {
			if (conn != null)
				conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void Rollback(Connection conn) {
		try {
			if (conn != null)
				conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection conn) {
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(PreparedStatement pstmt) {
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
