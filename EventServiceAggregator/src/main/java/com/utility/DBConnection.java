package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	

	public Connection dbConnection() {
		Connection c = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventmanagemant", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;

	}

}
