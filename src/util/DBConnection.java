package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	private static final String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String driverClass="oracle.jdbc.driver.OracleDriver";
	private static final String userName="typroj";
	private static final String password="typroj";
	private static Connection conn = null;
	public static Connection getConnection() 
	{
		
	
		
			
		try 
		{
			Class.forName(driverClass);
			conn= DriverManager.getConnection(url,userName,password);
			if(conn !=null) {
				System.out.println(" DB CONN");
			}
			else {
				System.out.println(" NOT CONN ");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	/*public static void main(String[] args) {
	}*/
	
	public static void main(String[] args) {
		
		Connection conn = getConnection();
	}
}


/*
 * FileInputStream fin = null;
try {
	fin = new FileInputStream("C:\\Users\\Vruttant\\eclipse-workspace\\ocwcdtemp\\WebContent\\dbConfig.properties");
} catch (FileNotFoundException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}

Properties prop = new Properties();
try {
	prop.load(fin);
} catch (IOException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
	String url = prop.getProperty("url").trim();
		String driverClass = prop.getProperty("driverClass").trim();
		String userName= prop.getProperty("userName").trim();
		String password= prop.getProperty("password").trim();
}*/
