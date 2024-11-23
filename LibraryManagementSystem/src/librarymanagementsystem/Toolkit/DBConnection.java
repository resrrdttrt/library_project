package librarymanagementsystem.Toolkit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class DBConnection {
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;
    
    private String DBName = null;
    private String username = null;
    private String password = null;
    
    // private final String ipAddress = "35.185.146.144:3306";
    private final String ipAddress = "localhost:3306";
    
    public DBConnection(){
        if (checkDriver() == true){
            //this.DBName = "quanlythuvien";
            this.DBName = "library";
            this.username = "res";
            this.password = "Mysql@123";
            setupConnection();
        }
    }
    
    public DBConnection(String DBName, String username, String password){
        if (checkDriver()){
            this.DBName = DBName;
            this.username = username;
            this.password = password;
            setupConnection();
        }
    }
    
    private boolean checkDriver(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            return true;
        }
        catch (ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Không tìm thấy MySql Driver.");
            System.err.print(e);
            return false;
        }
    }
    
    private void setupConnection(){
        try{
            String DBurl = "jdbc:mysql://" + ipAddress + "/" + DBName + "?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
            conn = DriverManager.getConnection(DBurl, username, password);
            stmt = conn.createStatement();
            System.out.println("Connected to " + DBName);
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Không thể kết nối tới " + DBName);
            System.err.println(e);
        }
    }
    
    private boolean checkConnection(){
        if (conn == null || stmt == null){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Chưa thiết lập kết nối tới " + DBName + ". Vui lòng đăng nhập để thiết lập kết nối!");
            return false;
        }
        else{
            return true;
        }
    }
    
    public ResultSet SQLQuery(String query){
        if (checkConnection()){
            try{
                rs = stmt.executeQuery(query);
                System.out.println(query + " Query success!");
                return rs;
            }
            catch (SQLException e){
                JOptionPane.showMessageDialog(null, "Lỗi!!! Không thể truy vẫn dữ liệu");
                System.out.println("Error: " + e.getMessage());
                return null;
            }
        }
        else{
            return null;
        }
    }
    
    public boolean SQLUpdate(String update){
        if (checkConnection()){
             try{
                stmt.executeUpdate(update);
                System.out.println(update + " Update success!");
                return true;
            }
            catch (SQLException e){
                System.err.println(e);
                JOptionPane.showMessageDialog(null, "Lỗi!!! Không thể cập nhật dữ liệu");
                return false;
            }
        }
        else{
            return false;
        }
    }
    
    public void closeConnection(){
        try{
            if (conn != null){
                conn.close();
            }
            if (stmt != null){
                stmt.close();
            }
            System.out.println("Disconnected to Database.");
        }
        catch (SQLException e){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Không thể đóng kết nối tới " + DBName);
        }
    }
}
