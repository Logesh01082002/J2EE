package Servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import StudentDAO.StudentDAO;
import StudentDTO.StudentDTO;

@WebServlet("/LoginStudent")
public class LoginStudent extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
		System.out.println("student login");
		String input=req.getParameter("input");
		
		
		try {
            Connection con = StudentDAO.con(); // Get database connection
            StudentDTO s ;
            
            if (input.contains("@")) {  
                 s = StudentDAO.findStudenyByEmail(input);
                 System.out.println(s+" first  one");
            } else {  
                 s = StudentDAO.findStudent(Integer.parseInt(input));
            }

            if (s!=null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", input);  // Store user session
                session.setAttribute("student", s);
                    System.out.println("student login success...."+s);
            
                req.getRequestDispatcher("student-marks.jsp").include(req, resp);
            } else {
            	
                req.setAttribute("message", "email or Id miss_match");
                req.getRequestDispatcher("student_login.jsp").forward(req, resp);
            }

            con.close();

        } catch (NumberFormatException e) {
            req.setAttribute("message", "Invalid ID format! Please enter a valid number.");
            req.getRequestDispatcher("studentlogin.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
