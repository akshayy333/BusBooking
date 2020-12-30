package Mycon;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Mysqlcon {
	public static Connection con=null;
	public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
		// Initialize all the information regarding
		// Database Connection
	String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";
		// Database name to access
		String dbName = "busbooking";
		String dbUsername = "root";
		String dbPassword = "Mysql@333";

		Class.forName(dbDriver);
		con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
		return con;
	}

}
