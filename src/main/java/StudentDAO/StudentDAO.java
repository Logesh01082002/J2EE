package StudentDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import StudentDTO.StudentDTO;

public class StudentDAO {
	// connection method
		public static Connection con() throws ClassNotFoundException, SQLException
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentms", "root", "root");
			return con;
		}
		
	// save student
		public static int saveStudent(StudentDTO s) throws ClassNotFoundException, SQLException
		{
			Connection con=con();
			PreparedStatement ps=con.prepareStatement("insert into student values (?,?,?,?,?)");
			ps.setInt(1,s.getId());
			ps.setString(2,s.getName());
			ps.setDouble(3, s.getChemistry());
			ps.setDouble(4, s.getPhysics());
			ps.setDouble(5, s.getMaths());
			return ps.executeUpdate();	
		}
		
		// edit student
		public static StudentDTO editStudent(int id) throws ClassNotFoundException, SQLException
		{
			Connection con=con();
			PreparedStatement ps=con.prepareStatement("select * from student where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			StudentDTO s=null;
			if(rs.next())
			{
			    s=new StudentDTO(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getDouble(4), rs.getDouble(5));
			}
			return s;
		}
		
		// delete Student
		public static int deleteStudent(int id) throws ClassNotFoundException, SQLException
		{
			Connection con=con();
			PreparedStatement ps=con.prepareStatement("delete from student where id = ?");
			ps.setInt(1, id);
			return ps.executeUpdate();
		}
		
		// find student
		public static StudentDTO findStudent(int id) throws ClassNotFoundException, SQLException
		{
			Connection con=con();
			PreparedStatement ps=con.prepareStatement("select * from student where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				StudentDTO s=new StudentDTO(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getDouble(4),rs.getDouble(5));
				return s;
			}
			return null;
		}
		
		// Find all Student
		public static List<StudentDTO> findAllStudent() throws SQLException, ClassNotFoundException
		{
			Connection con=con();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from student");
			List<StudentDTO> sl=new ArrayList();
			while(rs.next())
			{
				StudentDTO s=new StudentDTO(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getDouble(4),rs.getDouble(5));
				sl.add(s);
			}
			return sl;
		}
		
		//update student
		public static int updateStudent(StudentDTO s) throws ClassNotFoundException, SQLException
		{
			Connection con=con();
			PreparedStatement ps=con.prepareStatement("update student set name=? , chemistry=? , physics=?, maths=? where id=?");
			ps.setString(1, s.getName());
			ps.setDouble(2, s. getChemistry());
			ps.setDouble(3, s.getPhysics());
			ps.setDouble(4, s.getMaths());
			ps.setInt(5, s.getId());
			int row=ps.executeUpdate();
			
			return row;
		}
}



//  
