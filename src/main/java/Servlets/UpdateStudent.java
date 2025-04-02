package Servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import StudentDAO.StudentDAO;
import StudentDTO.StudentDTO;

@WebServlet("/UpdateStudent")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class UpdateStudent extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String id1=req.getParameter("id");
		String name=req.getParameter("name");
		String chemistry1=req.getParameter("chemistry");
		String physics1=req.getParameter("physics");
		String maths1=req.getParameter("maths");
		
		Part photo=req.getPart("photo");
		InputStream pis=photo.getInputStream();
		
		
		int id=Integer.parseInt(id1);
		double physics=Double.parseDouble(physics1);
		double chemistry=Double.parseDouble(chemistry1);
		double maths=Double.parseDouble(maths1);
		 
		StudentDTO s=new StudentDTO(id, name, chemistry, physics, maths,pis);
		
		if (pis != null) {
			try {
				int row=StudentDAO.updateStudent(s);
				System.out.println("update student complete..");
				req.setAttribute("delete", "student data updated succesfull!");
				req.getRequestDispatcher("adminhome.jsp").include(req, resp);
			} 
			catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			finally {
		        pis.close(); 
		    }
		}

		// Clean up temporary file 
		if (photo != null) {
			photo.delete();
		}
	}
} 
