package Servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import StudentDAO.StudentDAO;
import StudentDTO.StudentDTO;

@WebServlet("/UpdateStudent")
public class UpdateStudent extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String id1=req.getParameter("id");
		String name=req.getParameter("name");
		String physics1=req.getParameter("physics");
		String chemistry1=req.getParameter("chemistry");
		String maths1=req.getParameter("maths");
		
		int id=Integer.parseInt(id1);
		double physics=Double.parseDouble(maths1);
		double chemistry=Double.parseDouble(chemistry1);
		double maths=Double.parseDouble(maths1);
		 
		StudentDTO s=new StudentDTO(id, name, physics, chemistry, maths);
		
		try {
			int row=StudentDAO.updateStudent(s);
			req.getRequestDispatcher("adminhome.jsp").include(req, resp);
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
} 
