package com.farmsntech.db;

import java.io.IOException;
import java.sql.Connection;

public class DbUtils {
	

	public static Connection getConnection() throws IOException {
		Connection con;
		
			con = RdbmsUtils.getConnection();
		
		return con;
	}

	public static void main(String[] args) throws IOException {
		Connection connection = DbUtils.getConnection();
	}
}
