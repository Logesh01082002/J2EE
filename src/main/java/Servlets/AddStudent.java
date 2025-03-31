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

import StudentDAO.StudentDAO;
import StudentDTO.StudentDTO;

@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet{
 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id1=req.getParameter("id");
		String name=req.getParameter("name");
		String chemistry1=req.getParameter("chemistry");
		String physics1=req.getParameter("physics");
		String maths1=req.getParameter("maths");
		
		int id=Integer.parseInt(id1);
		double chemistry=Double.parseDouble(chemistry1);
		double physics=Double.parseDouble(physics1);
		double maths=Double.parseDouble(maths1);
		
		StudentDTO s=new StudentDTO(id,name,chemistry,physics,maths);
		try {
			int row=StudentDAO.saveStudent(s);
			req.getRequestDispatcher("adminhome.jsp").include(req, resp);
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			req.setAttribute("delete", "student id is already present..");
			req.getRequestDispatcher("add-student.jsp").include(req, resp);
		}
		 
	}
}
