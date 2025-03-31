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

@WebServlet("/EditStudent")
public class EditStudent extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id1=req.getParameter("id");
		int id=Integer.parseInt(id1);
		
		try {
			StudentDTO student=StudentDAO.findStudent(id);
			 req.setAttribute("student", student); 
			 System.out.println(student);
			req.setAttribute("delete", "student data edited succesfull!");
			req.getRequestDispatcher("edit-student.jsp").include(req, resp);
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
