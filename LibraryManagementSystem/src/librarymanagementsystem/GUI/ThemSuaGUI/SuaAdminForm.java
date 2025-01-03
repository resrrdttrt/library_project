
package librarymanagementsystem.GUI.ThemSuaGUI;

import java.awt.Color;
import javax.swing.JOptionPane;
import librarymanagementsystem.GUI.*;
import librarymanagementsystem.Toolkit.DataProcessing;
import librarymanagementsystem.BUS.QLAdminBUS;
import librarymanagementsystem.DTO.QLAdminDTO;

public class SuaAdminForm extends javax.swing.JFrame{
    int x_Mouse, y_Mouse; // For Moving Window
    static String error_mess;
    DataProcessing dp = new DataProcessing();
    static QLAdminBUS adBUS = new QLAdminBUS();
    String tkad;
    QLAdminDTO ad;
    
    public SuaAdminForm(String tkAdmin) {
        ad = new QLAdminBUS().getAdmin(tkAdmin);
        tkad = tkAdmin;
        initComponents(ad.getPassword());
        setSize(830, 216);
        setLocationRelativeTo(null);
        setBackground(new Color(0, 0, 0, 0));
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents(String password) {

        jPanel1 = new javax.swing.JPanel();
        addButton = new javax.swing.JLabel();
        exitButton = new javax.swing.JLabel();
        movingWindow = new javax.swing.JLabel();
        password_Field = new javax.swing.JPasswordField();
        tk_Label = new javax.swing.JLabel();
        nhanVienForm = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(null);

        jPanel1.setOpaque(false);
        jPanel1.setLayout(null);

        addButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("../../images/output-onlinepngtools - 2020-05-28T235936.194.png"))); // NOI18N
        addButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                addButtonMouseClicked(evt);
            }
        });
        addButton.setBounds(10, 7, 35, 35);
        jPanel1.add(addButton);

        exitButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("../../images/output-onlinepngtools (43).png"))); // NOI18N
        exitButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                exitButtonMouseClicked(evt);
            }
        });
        exitButton.setBounds(790, 16, 20, 20);
        jPanel1.add(exitButton);

        movingWindow.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                movingWindowMouseDragged(evt);
            }
        });
        movingWindow.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                movingWindowMousePressed(evt);
            }
        });
        movingWindow.setBounds(0, 0, 830, 60);
        jPanel1.add(movingWindow);
        
        
        tk_Label.setBackground(new java.awt.Color(245, 247, 250));
        tk_Label.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        tk_Label.setText(ad.getTkAdmin());
        tk_Label.setBorder(null);
        tk_Label.setOpaque(false);
        tk_Label.setBounds(48, 120, 230, 30);
        jPanel1.add(tk_Label);

        password_Field.setBackground(new java.awt.Color(245, 247, 250));
        password_Field.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        password_Field.setText(password);
        password_Field.setBorder(null);
        password_Field.setOpaque(false);
        password_Field.setBounds(320, 120, 140, 30);
        jPanel1.add(password_Field);
        
        nhanVienForm.setIcon(new javax.swing.ImageIcon(getClass().getResource("../../images/output-onlinepngtoolssuaadmin.png"))); // NOI18N
        nhanVienForm.setBounds(0, 0, 830, 216);
        jPanel1.add(nhanVienForm);
        jPanel1.setBounds(0, 0, 830, 216);
        
        getContentPane().add(jPanel1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    
    private boolean check_input(String tkAdmin,String password){
        if (tkAdmin.equals("")){
            error_mess = "Tài khoản trống!!!";
            return false;
        }
        if (password.equals("")){
            error_mess = "Password trống!!!";
            return false;
        }
        if (dp.check_maAdmin(tkAdmin)!=true){
            error_mess = "Tài khoản bị sai!!!";
            return false;
        }
        
        return true;
    }
    
    private void movingWindowMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_movingWindowMouseDragged
        int x = evt.getXOnScreen();
        int y = evt.getYOnScreen();
        
        setLocation(x - x_Mouse, y - y_Mouse);
    }//GEN-LAST:event_movingWindowMouseDragged

    
    private void movingWindowMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_movingWindowMousePressed
        x_Mouse = evt.getX();
        y_Mouse = evt.getY();
    }//GEN-LAST:event_movingWindowMousePressed

    private void exitButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_exitButtonMouseClicked
        this.dispose();
    }//GEN-LAST:event_exitButtonMouseClicked

    private void addButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_addButtonMouseClicked
        String password = password_Field.getText();
        String tkAdmin = tkad;
        
        if (check_input(tkAdmin, password)){
            int option = JOptionPane.showConfirmDialog(
                null, 
                "Bạn có muốn sửa mật khẩu của " + tkAdmin + " ?", 
                "Xóa Admin", 
                JOptionPane.YES_NO_OPTION);
            if(option == JOptionPane.YES_OPTION){
                System.out.println("Nhập Thành Công");
                if (adBUS.mod(tkAdmin, password)){
                    new AlertGUI(3, "Success", "Sửa Mật Khẩu Thành Công!!!", "Quay Lại").setVisible(true);
                    this.dispose();
                }
            }
        }
        else{
            System.err.println(error_mess);
            System.out.println("Sửa Thất Bại");
            new AlertGUI(2, "Error", error_mess, "Quay Lại").setVisible(true);
            // Alert Form
        }
        
        System.out.println(tkAdmin);
        System.out.println(password);
        
    }//GEN-LAST:event_addButtonMouseClicked

    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) {
           /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(SuaAdminForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SuaAdminForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SuaAdminForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SuaAdminForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new SuaAdminForm("AD000001").setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel addButton;
    private javax.swing.JLabel exitButton;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel nhanVienForm;
    private javax.swing.JLabel movingWindow;
    private javax.swing.JPasswordField password_Field;
    private javax.swing.JLabel tk_Label;
    // End of variables declaration//GEN-END:variables
}
