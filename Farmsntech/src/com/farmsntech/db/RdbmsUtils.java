package com.farmsntech.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;


public class RdbmsUtils {
	static Connection con;

	public static Connection getConnection() throws IOException {
		if (con == null) {
			con = getDBConnection();
		}
		return con;
	}

	private static Connection getDBConnection() throws IOException {
		
		 Connection con=null;
		    try
		    {
		        Properties prop=new Properties();
		     //   Properties prop = new Properties();
		        InputStream in = RdbmsUtils.class.getResourceAsStream("kalyan.properties");
		        prop.load(in);
		        
		       

		        String drivers = prop.getProperty("driverclass");
		        String URL = prop.getProperty("url");
		        String username = prop.getProperty("username");
		        String password = prop.getProperty("password");

		        //Class.forName("com.mysql.jdbc.Driver").newInstance();
		        Class.forName(drivers);
		        con=DriverManager.getConnection(URL,username,password);

		            System.out.println("Connection Successful");
		            return con;     
		    }
		    catch(Exception e)
		    {
		        System.out.println(e);
		    }
		    return null;
	}

	public static void main(String[] args) throws IOException {
		Connection connection = RdbmsUtils.getConnection();
	}
}