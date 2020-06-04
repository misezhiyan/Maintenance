package com.maintenance.util.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.maintenance.po.Database;

public class Db2Factory {

	private static Connection connection;

	public static Connection getConnection(Database database) throws SQLException {

		if (null == connection || connection.isClosed()) {
			String ip = database.getIp();
			String port = database.getPort();
			String dbname = database.getDbname();
			String user = database.getUser();
			String passWord = database.getPassword();

			connection = getConnection(ip, port, dbname, user, passWord);
		}

		return connection;
	}

	private static Connection getConnection(String ip, String port, String dbname, String user, String passWord) throws SQLException {

		return DriverManager.getConnection("jdbc:db2://" + ip + ":" + port + "/" + dbname, user, passWord);
	}

}
