<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="StudentDAO.StudentDAO, StudentDTO.StudentDTO, java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
      <style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin: 0;
    }
    table {
        border-collapse: collapse;
        width: 70%;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid black;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: lightblue;
    }
    button {
        background-color: tomato;
        color: white;
        padding: 5px 10px;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background-color: red;
    }
    #addstudent{
        display: inline-block;
        background: #d9ffb3;
        border: 2px solid red;
        border-radius: 20px;
        padding: 10px 20px;
        text-decoration: none;
        margin-top: 20px;
        position:relative;
        left:-300px;
    }
    #but{
    color :red;
     display: inline-block;
        background:  #00ff00;
        border: 2px solid #000099;
         padding: 10px 20px;
        text-decoration: none;
    }
     #but2{
     display: inline-block;
        background: #ff5c33;
        border: 2px solid blue;
         padding: 10px 20px;
        text-decoration: none;
    }
    #lo{
     display: inline-block;
        background: #669999;
        border: 2px solid red;
         padding: 10px 20px;
        text-decoration: none;
        position:relative;
        top:-40px;
        left:300px;
    }
      .mess{
            display: inline-block;
            width: 300px;
            position:relative;
            left:0px;
            top:5px;
            
         }
         h3{
         color:blue;
         }
  </style>
</head>
<body>
    <h2>Admin Home</h2>
    <%
        StudentDAO dao = new StudentDAO();
        List<StudentDTO> studentList = dao.findAllStudent();
        
        if (studentList != null && !studentList.isEmpty()) {
    %>
        <h3>Student List</h3>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Profile</th>
                <th>Name</th>
                <th>chemistry</th>
                 <th>physics</th>
                <th>Maths</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <%
                for (StudentDTO student : studentList) {
            %>
                <tr>
                    <td><%= student.getId() %></td>
                    <% String image = Base64.getEncoder().encodeToString(student.getPhoto().readAllBytes()); %>
                   <!--  <td> <img src="data:image/jpg;<%=image %>>" alt="Profile" width="50" height="50" style="border-radius: 50%;">  </td>  -->
                   <td> <img src="data:image/jpeg;base64,<%= image %>" alt="Profile" width="70" height="50">  </td> 
                    <td><%= student.getName() %></td>
                    <td><%= student.getChemistry()%></td>
                    <td><%= student.getPhysics() %></td>
                    <td><%= student.getMaths() %></td>
                    
                    <td>
                        <form action="EditStudent" method="post">
                           <input type="hidden" name="id" value="<%= student.getId() %>">
                           <button type="submit" id="but">Edit </button>
                        </form></td> 
                      </td>
                    <td><form action="DeleteStudent" method="post">
                           <input type="hidden" name="id" value="<%= student.getId() %>">
                           <button type="submit" id="but2">Delete</button>
                        </form></td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        } else {
    %>
        <p>No students found.</p>
    <%
        }
    %>
    <% String mess = (String) request.getAttribute("delete"); %>
    <% if (mess != null) { %>
        <p class="mess" style="color: red; text-align: center;"><%= mess %></p>
    <% } %>

    <br>
        <a id="addstudent" href="add-student.jsp">Add Student</a>
        <form action="Logout" method="post">
               <button type="submit" id="lo">Logout</button>
         </form>
</body>
</html>
