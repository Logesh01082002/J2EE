package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import StudentDAO.AdminDAO;

@WebServlet("/adminSignUp")
public class AdminSignUp extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String id1=req.getParameter("id");
		String name=req.getParameter("name");
		String contact1=req.getParameter("contact");
		String gmail=req.getParameter("gmail");
		String pass=req.getParameter("pass1");
		
		int id=Integer.parseInt(id1);
		double contact=Double.parseDouble(contact1);
		
		Connection con=AdminDAO.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("insert into admin values (?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, gmail);
			ps.setDouble(4, contact);
			ps.setString(5, pass);
			
			int row=ps.executeUpdate();
			
			 req.getRequestDispatcher("adminlogin.jsp").include(req, res);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
