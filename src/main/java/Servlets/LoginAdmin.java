package Servlets;
import StudentDAO.AdminDAO;
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
            PreparedStatement ps = con.prepareStatement("SELECT password FROM admin WHERE gmail = ?");
            ps.setString(1, gmail);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) { 
                String dbpass = rs.getString("password");  
                System.out.println("DB Password: " + dbpass);

                if (pass.equals(dbpass)) {
                	HttpSession ses=req.getSession();
                    req.getRequestDispatcher("adminhome.jsp").include(req, res);
                } else {
                	req.setAttribute("message", "Invalid Credential");
                	req.getRequestDispatcher("adminlogin.jsp").forward(req, res);
                }
            } else {
            	req.setAttribute("message1", "No account found with this email!");
            	req.getRequestDispatcher("adminlogin.jsp").forward(req, res);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (NumberFormatException e) {
            res.getWriter().println("Invalid password format! Password should be a number.");
        } catch (SQLException e) {
            e.printStackTrace();
            res.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
//