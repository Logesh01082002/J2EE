package Servlets;
import StudentDAO.AdminDAO;
import StudentDAO.StudentDAO;
import StudentDTO.StudentDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {
	
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String gmail = req.getParameter("gmail");
        String pass = req.getParameter("password");
        
        System.out.println(gmail);
        try {
            Connection con = AdminDAO.getConnection();
	    	 boolean s= AdminDAO.findAdmin(gmail,pass);
			
               if (s)
                { 
                	HttpSession ses=req.getSession();
                    req.getRequestDispatcher("adminhome.jsp").include(req, res);
                } else {
                	req.setAttribute("message", "Invalid Credential");
                	req.getRequestDispatcher("adminlogin.jsp").forward(req, res);
                }
               
            con.close();

        } catch (NumberFormatException e) {
            res.getWriter().println("Invalid password format! Password should be a number.");
        } catch (SQLException e) {
            e.printStackTrace();
            res.getWriter().println("Database error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }
}
//