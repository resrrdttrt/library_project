package librarymanagementsystem.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import librarymanagementsystem.DTO.*;
import librarymanagementsystem.Toolkit.*;

public class QLLDPhatDAO {
    DBConnection DBLDPhat;
    
    public ArrayList<QLLDPhatDTO> readDB(){
        DBLDPhat = new DBConnection();
        ArrayList<QLLDPhatDTO> arrLDPhat = new ArrayList<>();
        
        try{
            String query = "SELECT * FROM lydophat";
            ResultSet rs = DBLDPhat.SQLQuery(query);
            if (rs != null){
                while (rs.next()){
                    String maLDPhat = rs.getString("maLDPhat");
                    String tenLDPhat = rs.getString("tenLDPhat");
                    int mucDo = rs.getInt("mucDo");
                    arrLDPhat.add(new QLLDPhatDTO(maLDPhat, tenLDPhat, mucDo));
                }
            }

        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Lỗi đọc dữ liệu bảng Lý Do Phạt");
        } 
        finally{
            DBLDPhat.closeConnection();
        }
        return arrLDPhat;
    }
    
    public Boolean add(QLLDPhatDTO LDPhat){
        DBLDPhat = new DBConnection();
        Boolean check = DBLDPhat.SQLUpdate("INSERT INTO lydophat(maLDPhat, tenLDPhat, mucDo) "
                + "VALUES ('"
                + LDPhat.getMaLDPhat()+ "','"  
                + LDPhat.getTenLDPhat()+ "','"  
                + LDPhat.getMucDo()+ "');");
        DBLDPhat.closeConnection();
        return check;
    }
    
     public Boolean del(String maLDPhat){
        Boolean check = DBLDPhat.SQLUpdate("DELETE FROM lydophat WHERE lydophat.maLDPhat = '" + maLDPhat + "';");
        DBLDPhat.closeConnection();
        return check;
    }
    
    public Boolean mod(QLLDPhatDTO LDPhat){
        DBLDPhat = new DBConnection();
        Boolean check = DBLDPhat.SQLUpdate("Update lydophat Set "
                + " tenLDPhat='" + LDPhat.getTenLDPhat()
                + "', mucDo='" + LDPhat.getMucDo()
                + "' where maLDPhat='" + LDPhat.getMaLDPhat()+ "';");
        DBLDPhat.closeConnection();
        return check;
    }
}
