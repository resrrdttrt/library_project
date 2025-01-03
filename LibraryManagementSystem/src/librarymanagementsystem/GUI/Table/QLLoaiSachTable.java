package librarymanagementsystem.GUI.Table;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.WindowConstants;
import librarymanagementsystem.BUS.QLLoaiSachBUS;
import librarymanagementsystem.DTO.QLLoaiSachDTO;

public class QLLoaiSachTable{
    
    // for testing
    private static JFrame createFrame() {
        JFrame frame = new JFrame("Testing");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(new Dimension(700, 500));
        return frame;
    }
        
    private static ObjectTableModel<QLLoaiSachDTO> createObjectDataModel(){
        return new ObjectTableModel<QLLoaiSachDTO>() {
            @Override
            public Object getValueAt(QLLoaiSachDTO loaiSach, int columnIndex) {
                switch (columnIndex) {
                    case 0:
                        return loaiSach.getMaSach();
                    case 1:
                        return loaiSach.getTenSach();
                    case 2:
                        return loaiSach.getTenTacGia();
                    case 3:
                        return loaiSach.getTenNXB();
                    case 4:
                        return loaiSach.getTheLoai();
                    case 5:
                        return loaiSach.getNgonNgu();
                    case 6:
                        return loaiSach.getTomTatNoiDung();
                    case 7:
                        return loaiSach.getNamXB();
                    case 8:
                        return loaiSach.getGiaTien();
                    case 9:
                        return loaiSach.getSoTrang();
                }
                return null;
            }

            @Override
            public int getColumnCount() {
                return 10;
            }

            @Override
            public String getColumnName(int column) {
                switch (column) {
                    case 0:
                        return "Mã Sách";
                    case 1:
                        return "Tên Sách";
                    case 2:
                        return "Tên Tác Giả";
                    case 3:
                        return "Tên NXB";
                    case 4:
                        return "Thể Loại";
                    case 5:
                        return "Ngôn Ngữ";
                    case 6:
                        return "Tóm Tắt Nội Dung";
                    case 7:
                        return "Năm Xuất Bản";
                    case 8:
                        return "Giá Tiền";
                    case 9:
                        return "Số Trang";
                }
                return null;
            }
        };
    }
    
    private static PaginationDataProvider<QLLoaiSachDTO> createDataProvider(
            ObjectTableModel<QLLoaiSachDTO> objectDataModel) {
        final List<QLLoaiSachDTO> list = new QLLoaiSachBUS().getArrSach();
        return new InMemoryPaginationDataProvider<>(list, objectDataModel);
    }
    
    private static PaginationDataProvider<QLLoaiSachDTO> createDataProvider(
            ObjectTableModel<QLLoaiSachDTO> objectDataModel, ArrayList <QLLoaiSachDTO> loaiSach) {
        final List<QLLoaiSachDTO> list = loaiSach;
        return new InMemoryPaginationDataProvider<>(list, objectDataModel);
    }
    
    public JPanel getTable(){
        ObjectTableModel<QLLoaiSachDTO> objectDataModel = createObjectDataModel();
        JTable table = new JTable(objectDataModel);
        
        //** Adjust Table**//
        table.setRowHeight(35);
        //table.setIntercellSpacing(new Dimension(20, 0)); // Spacing 
        //table.getColumnModel().getColumn(0).setPreferredWidth(70);
        
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment( JLabel.CENTER );
        
        /* Align
        table.setDefaultRenderer(String.class, centerRenderer);
        table.setDefaultRenderer(Object.class, centerRenderer);
        table.setDefaultRenderer(Integer.class, centerRenderer);
        table.setDefaultRenderer(Long.class, centerRenderer);
        table.setDefaultRenderer(Double.class, centerRenderer);
        */
        
        table.setFont(new Font("verdana", Font.PLAIN, 13));
        
        table.getTableHeader().setBackground(new Color(91, 243, 207));
        table.getTableHeader().setPreferredSize(new Dimension(0,35)); // Header Height
        table.getTableHeader().setFont(new Font("verdana", Font.BOLD, 14));
        // Change
        table.getTableHeader().setForeground(Color.WHITE);
        //table.getTableHeader().setForeground(new Color(56, 180, 123));
        
        //table.getTableHeader().;
        //** End Adjust **//
        
        /** Table Column Width **/
        ArrayList <Integer> width = new ArrayList<>();
        
        width.add(100);
        width.add(400);
        width.add(160);
        width.add(300);
        width.add(230);
        width.add(130);
        width.add(400);
        width.add(130);
        width.add(100);
        width.add(100);
        
        table.setAutoCreateRowSorter(true);
        PaginationDataProvider<QLLoaiSachDTO> dataProvider = createDataProvider(objectDataModel);
        PaginatedTableDecorator<QLLoaiSachDTO> paginatedDecorator = PaginatedTableDecorator.decorate(table,
                dataProvider, new int[]{5, 10, 20, 50, 75, 100}, 10, width);
        //paginatedDecorator.getClickEvent(); // event for LoaiSach Table
        paginatedDecorator.getClickEvent_LoaiSach();
        JPanel p = paginatedDecorator.getContentPanel();
        return p;
    }
    
    public JPanel getTable(ArrayList <QLLoaiSachDTO> loaiSach){
        ObjectTableModel<QLLoaiSachDTO> objectDataModel = createObjectDataModel();
        JTable table = new JTable(objectDataModel);
        
        //** Adjust Table**//
        table.setRowHeight(35);
        //table.setIntercellSpacing(new Dimension(20, 0)); // Spacing 
        //table.getColumnModel().getColumn(0).setPreferredWidth(70);
        
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment( JLabel.CENTER );
        
        /* Align
        table.setDefaultRenderer(String.class, centerRenderer);
        table.setDefaultRenderer(Object.class, centerRenderer);
        table.setDefaultRenderer(Integer.class, centerRenderer);
        table.setDefaultRenderer(Long.class, centerRenderer);
        table.setDefaultRenderer(Double.class, centerRenderer);
        */
        
        table.setFont(new Font("verdana", Font.PLAIN, 13));
        
        table.getTableHeader().setBackground(new Color(91, 243, 207));
        table.getTableHeader().setPreferredSize(new Dimension(0,35)); // Header Height
        table.getTableHeader().setFont(new Font("verdana", Font.BOLD, 14));
        // Change
        table.getTableHeader().setForeground(Color.WHITE);
        //table.getTableHeader().setForeground(new Color(56, 180, 123));
        
        //table.getTableHeader().;
        //** End Adjust **//
        
        /** Table Column Width **/
        ArrayList <Integer> width = new ArrayList<>();
        
        width.add(100);
        width.add(400);
        width.add(160);
        width.add(300);
        width.add(230);
        width.add(130);
        width.add(400);
        width.add(130);
        width.add(100);
        width.add(100);
        
        table.setAutoCreateRowSorter(true);
        PaginationDataProvider<QLLoaiSachDTO> dataProvider = createDataProvider(objectDataModel, loaiSach);
        PaginatedTableDecorator<QLLoaiSachDTO> paginatedDecorator = PaginatedTableDecorator.decorate(table,
                dataProvider, new int[]{5, 10, 20, 50, 75, 100}, 10, width);
        
        paginatedDecorator.getClickEvent_LoaiSach();
        JPanel p = paginatedDecorator.getContentPanel();
        return p;
    }
    
    public void expandMode(){
        JFrame frame = createFrame();
        JPanel p = new QLLoaiSachTable().getTable();
        //frame.add(paginatedDecorator.getContentPanel());
        p.setSize(1200, 780);
        p.setBackground(new java.awt.Color(255, 255, 255));
        frame.add(p);
        frame.setBackground(new java.awt.Color(255, 255, 255));
         
        /**/
        frame.setSize(1200, 740);
        frame.setLocationRelativeTo(null);
        frame.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
        frame.addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                System.out.println("Window Closed");
                frame.dispose();
            }
        });
        frame.setVisible(true);
    }
    
    public static void main(String[] args) {
        JFrame frame = createFrame();
        JPanel p = new QLLoaiSachTable().getTable();
        //frame.add(paginatedDecorator.getContentPanel());
        p.setSize(700, 500);
        p.setBackground(new java.awt.Color(255, 255, 255));
        frame.add(p);
        frame.setBackground(new java.awt.Color(255, 255, 255));
         
        /**/
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
