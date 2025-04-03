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

@WebServlet("/DeleteStudent")
public class DeleteStudent extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
		  try {
			  String id1=req.getParameter("id");
			  int id=Integer.parseInt(id1);
			  
			int row=StudentDAO.deleteStudent(id);
			if(row>0)
			{
				req.setAttribute("delete", "      student data delete succesfull!");
				req.getRequestDispatcher("adminhome.jsp").include(req, resp);
			}
		} 
		  catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
