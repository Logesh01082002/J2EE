package StudentDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import StudentDTO.AdminDTO;

public class AdminDAO {
	
	 // Method to establish database connection
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentms", "root", "root");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); 
        }
        return con;
    }
	
	// save admin
	public int saveAdmin(AdminDTO a) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into admin values(?,?,?,?,?)");
		ps.setInt(1,a.getId());
		ps.setString(2, a.getName());
		ps.setString(3, a.getGmail());
		ps.setLong(4, a.getContact());
		ps.setString(5,a.getPassword());
		return ps.executeUpdate();	
	}
	
	// find admin
	public boolean findAdmin(String gmail,String password) throws ClassNotFoundException, SQLException
	{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from admin where gmail = ? and password = ? ");
		ps.setString(1,gmail);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		return rs.next() ? true : false;
	}
}
