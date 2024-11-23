package librarymanagementsystem.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import librarymanagementsystem.DTO.*;
import librarymanagementsystem.Toolkit.*;

public class QLChiTietSachDAO {
    DBConnection DBChiTietSach;
    
    public ArrayList<QLChiTietSachDTO> readDB(){
        DBChiTietSach = new DBConnection();
        ArrayList<QLChiTietSachDTO> arrChiTietSach = new ArrayList<>();
        
        try{
            String query = "SELECT * FROM chitietsach";
            ResultSet rs = DBChiTietSach.SQLQuery(query);
            if (rs != null){
                while (rs.next()){
                    String IDSach = rs.getString("IDSach");
                    String maSach = rs.getString("maSach");
                    String tinhTrang = rs.getString("tinhTrang");
                    arrChiTietSach.add(new QLChiTietSachDTO(IDSach, maSach, tinhTrang));
                }
            }

        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Lỗi đọc dữ liệu bảng Chi Tiết Sách");
        } 
        finally{
            DBChiTietSach.closeConnection();
        }
        return arrChiTietSach;
    }
    
    public ArrayList<QLChiTietSachDTO> readDB_full(){
        DBChiTietSach = new DBConnection();
        ArrayList<QLChiTietSachDTO> arrChiTietSach = new ArrayList<>();
        
        try{
            String query = "SELECT * FROM chitietsach, LoaiSach WHERE chitietsach.maSach = LoaiSach.maSach";
            ResultSet rs = DBChiTietSach.SQLQuery(query);
            if (rs != null){
                while (rs.next()){
                    String IDSach = rs.getString("IDSach");
                    String maSach = rs.getString("maSach");
                    String tinhTrang = rs.getString("tinhTrang");
                    String tenSach = rs.getString("tenSach");
                    String tenTacGia = rs.getString("tenTacGia");
                    String tenNXB = rs.getString("tenNXB");
                    String theLoai = rs.getString("theLoai");
                    String ngonNgu = rs.getString("ngonNgu");
                    String tomTatNoiDung = rs.getString("tomTatNoiDung");
                    int namXB = rs.getInt("namXB");
                    int giaTien = rs.getInt("giaTien");
                    int soTrang = rs.getInt("soTrang");
                    String hinh = rs.getString("hinhSach");
                    QLLoaiSachDTO sach = new QLLoaiSachDTO(maSach, tenSach, tenTacGia, tenNXB, theLoai, ngonNgu, tomTatNoiDung, namXB, giaTien, soTrang, hinh);
                    arrChiTietSach.add(new QLChiTietSachDTO(IDSach, maSach, tinhTrang, sach));
                }
            }

        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null, "Lỗi!!! Lỗi đọc dữ liệu bảng Chi Tiết Sách");
        } 
        finally{
            DBChiTietSach.closeConnection();
        }
        return arrChiTietSach;
    }
    
    public Boolean add(QLChiTietSachDTO chiTietSach){
        DBChiTietSach = new DBConnection();
        Boolean check = DBChiTietSach.SQLUpdate("INSERT INTO chitietsach(IDSach, maSach, tinhTrang) "
                + "VALUES ('"
                + chiTietSach.getIDSach()+ "','"  
                + chiTietSach.getMaSach()+ "','"  
                + chiTietSach.getTinhTrang()+ "');");
        DBChiTietSach.closeConnection();
        return check;
    }
    
     public Boolean del(String IDSach){
        Boolean check = DBChiTietSach.SQLUpdate("DELETE FROM chitietsach WHERE chitietsach.IDSach = '" + IDSach + "';");
        DBChiTietSach.closeConnection();
        return check;
    }
    
    public Boolean mod(QLChiTietSachDTO chiTietSach){
        DBChiTietSach = new DBConnection();
        Boolean check = DBChiTietSach.SQLUpdate("Update chitietsach Set "
                + " maSach='" + chiTietSach.getMaSach()
                + "', tinhTrang='" + chiTietSach.getTinhTrang()
                + "' where IDSach='" + chiTietSach.getIDSach()+ "';");
        DBChiTietSach.closeConnection();
        return check;
    }
}
