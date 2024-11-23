package librarymanagementsystem.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import librarymanagementsystem.DTO.*;
import librarymanagementsystem.Toolkit.*;

public class QLAdminDAO {
    DBConnection DBAdmin;
    
    public ArrayList<QLAdminDTO> readDB(){
        DBAdmin = new DBConnection();
        ArrayList<QLAdminDTO> arrAdmin = new ArrayList<>();
        
        try{
            String query = "SELECT * FROM library.admin";
            ResultSet rs = DBAdmin.SQLQuery(query);
            if (rs != null){
                while (rs.next()){
                    String tkAdmin = rs.getString("tkAdmin");
                    String password = rs.getString("password");
                    String salt = rs.getString("salt");
                    arrAdmin.add(new QLAdminDTO(tkAdmin, password, salt));
                }
            }

        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Lỗi đọc dữ liệu bảng Admin");
        } 
        finally{
            DBAdmin.closeConnection();
        }
        return arrAdmin;
    }
    
    public Boolean add(QLAdminDTO admin){
        DBAdmin = new DBConnection();
        Boolean check = DBAdmin.SQLUpdate("INSERT INTO library.admin(tkAdmin, password_hashed, salt) "
                + "VALUES ('"
                + admin.getTkAdmin() + "', '"
                + admin.getPassword() + "', '"
                + new PasswordHashing().getSalt() + "');");
        DBAdmin.closeConnection();
        return check;
    }
    
    public Boolean del(String tkAdmin){
        DBAdmin = new DBConnection();
        Boolean check = DBAdmin.SQLUpdate("DELETE FROM library.admin WHERE admin.tkAdmin = '" + tkAdmin + "'");
        DBAdmin.closeConnection();
        return check;
    }
    
    public Boolean mod(QLAdminDTO admin){
        DBAdmin = new DBConnection();
        Boolean check = DBAdmin.SQLUpdate("Update library.admin Set "
                + "', password_hashed='" + admin.getTkAdmin()
                + " where tkAdmin='" + admin.getPassword() + "'");
        DBAdmin.closeConnection();
        return check;
    }
    
    
    public static void main(String[] args) {
        new QLAdminDAO().add(new QLAdminDTO("1", "1"));
    }
}
