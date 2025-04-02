package Servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import StudentDAO.StudentDAO;
import StudentDTO.StudentDTO;

@WebServlet("/DisplayStudentPhoto")
public class DisplayStudentPhoto extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            StudentDTO student = StudentDAO.findStudent(id);
            
            if (student != null) {
                InputStream photoStream = student.getPhoto();
                
                if (photoStream != null) {
                    response.setContentType("image/jpeg");
                    OutputStream o = response.getOutputStream();
                    
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = photoStream.read(buffer)) != -1) {
                        o.write(buffer, 0, bytesRead);
                    }
                    o.flush();
                    o.close();
                    photoStream.close();
                } else {
                    response.getWriter().println("No image found.");
                }
            } else {
                response.getWriter().println("Student not found.");
            }
        } catch (ClassNotFoundException | SQLException e) {
           
        }
    }
}

// infiniti software solutions  --> 23,24,25 
