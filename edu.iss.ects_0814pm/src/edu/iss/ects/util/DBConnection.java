package edu.iss.ects.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库联接程序
 */
public class DBConnection {

	// 配置文件名,应置于classes目录下
	private static String CONFIG_FILENAME = "config.properties";

	// 配置文件
	private Properties prop = null;

	// 连接数据库的驱动程序
	private String driverName = "";
	// 连接数据库的URL
	private String url = "";

	// 连接数据库的用户与口令
	private String user = "";
	private String password = "";

	/**
	 * 构造函数：从属性文件中获取联接数据库信息
	 * 
	 * @throws Exception
	 */
	public DBConnection() throws Exception {
		prop = new Properties();
		// 读取配置文件信息
		InputStream in = DBConnection.class.getResourceAsStream("/"
				+ CONFIG_FILENAME);
		prop.load(in);
		// 驱动程序名称
		driverName = prop.getProperty("DataBaseDrivers").trim();
		user = prop.getProperty("DataBaseUser");// 用户,口令
		password = prop.getProperty("DataBaseUserPassword");
		url = getDBURL();// url
		// 装载驱动程序
		Class.forName(driverName).newInstance();

	}

	/**
	 * 从属性文件中获取信息来组装数据库连接的url
	 * 
	 * @return String
	 */
	private String getDBURL() {
		if (prop.getProperty("DataBaseType").equals("MySQL")) {
			return "jdbc:mysql://" + prop.getProperty("DataBaseServerName")
					+ ":" + prop.getProperty("DataBaseServerPort") + "/"
					+ prop.getProperty("DataBaseName");
		}
		return url;
	}

	/**
	 * 返回数据库连接
	 * 
	 * @return Connection
	 * @throws SQLException
	 */
	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}

	/**
	 * 关闭数据库连接
	 * @param conn
	 */
	public void closeConnection(Connection conn) {

		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws Exception {
		// 测试数据库连接
		DBConnection dbconnection = new DBConnection();
		System.out.println("Connection URL =" + dbconnection.getDBURL());
		dbconnection.getConnection();
		System.out.println("Connection OK!");

	}
}
