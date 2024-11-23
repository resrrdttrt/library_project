package librarymanagementsystem.Toolkit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    
    private String DBName = null;
    private String username = null;
    private String password = null;
    
    private final String ipAddress = "localhost";
    private final String port = "1433";
    
    public DBConnection() {
        if (checkDriver()) {
            this.DBName = "library"; // Default database name
            this.username = "sa"; // Default username
            this.password = "Mysql@123"; // Default password
            setupConnection();
        }
    }
    
    public DBConnection(String DBName, String username, String password) {
        if (checkDriver()) {
            this.DBName = DBName;
            this.username = username;
            this.password = password;
            setupConnection();
        }
    }
    
    private boolean checkDriver() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("JDBC Driver loaded successfully.");
            return true;
        } catch (ClassNotFoundException e) {
            System.err.println("Error: SQL Server JDBC Driver not found.");
            e.printStackTrace();
            return false;
        }
    }
    
    private void setupConnection() {
        String connectionUrl = "jdbc:sqlserver://" + ipAddress + ":" + port 
                + ";databaseName=" + DBName 
                + ";encrypt=false;trustServerCertificate=true";
        try {
            conn = DriverManager.getConnection(connectionUrl, username, password);
            stmt = conn.createStatement();
            System.out.println("Database connection established successfully.");
        } catch (SQLException e) {
            System.err.println("Error: Unable to establish database connection.");
            e.printStackTrace();
        }
    }
    
    private boolean checkConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                System.out.println("Connection is valid.");
                return true;
            } else {
                System.err.println("Connection is not valid.");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("Error while checking the connection.");
            e.printStackTrace();
            return false;
        }
    }
    
    public ResultSet SQLQuery(String query) {
        try {
            if (checkConnection()) {
                rs = stmt.executeQuery(query);
                System.out.println("Query executed successfully: " + query);
                return rs;
            } else {
                System.err.println("Query failed: Connection is not valid.");
            }
        } catch (SQLException e) {
            System.err.println("Error while executing query: " + query);
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean SQLUpdate(String update) {
        try {
            if (checkConnection()) {
                int rowsAffected = stmt.executeUpdate(update);
                System.out.println("Update executed successfully. Rows affected: " + rowsAffected);
                return true;
            } else {
                System.err.println("Update failed: Connection is not valid.");
            }
        } catch (SQLException e) {
            System.err.println("Error while executing update: " + update);
            e.printStackTrace();
        }
        return false;
    }
    
    public void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
                System.out.println("ResultSet closed.");
            }
            if (stmt != null) {
                stmt.close();
                System.out.println("Statement closed.");
            }
            if (conn != null) {
                conn.close();
                System.out.println("Connection closed.");
            }
        } catch (SQLException e) {
            System.err.println("Error while closing the connection.");
            e.printStackTrace();
        }
    }
}