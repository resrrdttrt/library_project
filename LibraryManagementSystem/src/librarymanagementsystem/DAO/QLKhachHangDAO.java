package librarymanagementsystem.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import librarymanagementsystem.DTO.*;
import librarymanagementsystem.Toolkit.*;

public class QLKhachHangDAO {
    DBConnection DBKhachHang;
    
    public ArrayList<QLKhachHangDTO> readDB(){
        DBKhachHang = new DBConnection();
        ArrayList<QLKhachHangDTO> arrKhachHang = new ArrayList<>();
        
        try{
            String query = "SELECT * FROM khachhang";
            ResultSet rs = DBKhachHang.SQLQuery(query);
            if (rs != null){
                while (rs.next()){
                    String maKhachHang = rs.getString("maKhachHang");
                    String hoTen = rs.getString("hoTen");
                    String ngaySinh = rs.getString("ngaySinh");
                    String diaChi = rs.getString("diaChi");
                    String email = rs.getString("email");
                    String sdt = rs.getString("sdt");
                    arrKhachHang.add(new QLKhachHangDTO(maKhachHang, hoTen, ngaySinh, diaChi, email, sdt));
                }
            }

        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Lỗi đọc dữ liệu bảng Khách Hàng");
        } 
        finally{
            DBKhachHang.closeConnection();
        }
        return arrKhachHang;
    }
    
    public Boolean add(QLKhachHangDTO khachHang){
        DBKhachHang = new DBConnection();
        Boolean check = DBKhachHang.SQLUpdate("INSERT INTO khachhang(maKhachHang, hoTen, ngaySinh, diaChi, sdt, email) "
                + "VALUES ('"
                + khachHang.getMaKhachHang()+ "','"  
                + khachHang.getHoTen()+ "','"  
                + khachHang.getNgaySinh()+ "','"  
                + khachHang.getDiaChi()+ "','"  
                + khachHang.getSdt()+ "','"  
                + khachHang.getEmail()+ "');"); 
        DBKhachHang.closeConnection();
        return check;
    }
    
     public Boolean del(String maKhachHang){
        Boolean check = DBKhachHang.SQLUpdate("DELETE FROM khachhang WHERE khachhang.maKhachHang = '" + maKhachHang + "';");
        DBKhachHang.closeConnection();
        return check;
    }
    
    public Boolean mod(QLKhachHangDTO khachHang){
        DBKhachHang = new DBConnection();
        Boolean check = DBKhachHang.SQLUpdate("Update khachhang Set "
                + " hoTen='" + khachHang.getHoTen()
                + "', ngaySinh='" + khachHang.getNgaySinh()
                + "', diaChi='" + khachHang.getDiaChi()
                + "', sdt='" + khachHang.getSdt()
                + "', email='" + khachHang.getEmail()
                + "' where maKhachHang='" + khachHang.getMaKhachHang()+ "';");
        DBKhachHang.closeConnection();
        return check;
    }
}
