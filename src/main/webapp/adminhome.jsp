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
        background: linear-gradient(to right, #74ebd5, #acb6e5);
        
    }
    table {
        border-collapse: collapse;
        width: 80%;
        margin-top: 20px;
        animation: slideUp 0.6s ease-in-out;
    }
     td {
        border: 1px solid black;
        padding: 10px 20px;
        text-align: center;
    }
    th {
        background-color: lightblue;
         padding: 10px 20px;
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
     
        padding: 10px 20px;
        text-decoration: none;
        margin-top: 20px;
        position:relative;
        left:450px;
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
    #but3{
        background: #e7e7e7;
        position:relative;
        top:-80px;
        left:80px;
        border: 2px solid orange;
         padding: 10px 20px;
        
    }
    #a{
    text-decoration: none;
    color:black;
    
    }
    #lo{
     display: inline-block;
        background: #669999;
        border: 2px solid red;
         padding: 10px 20px;
        text-decoration: none;
        position:relative;
        top:-40px;
        left:870px;
    }
      .mess{
            display: inline-block;
            width: 300px;
            position:relative;
            left:280px;
            top:5px;
            
         }
          #container {
            background: white;
            padding: 30px;
            width:80%;
            padding-left:100px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-in-out;
        }
         
        h3 {
       font-size: 28px;
    font-weight: bold;
    color: #00ffcc;
    text-align: center;
    text-shadow: 0 0 5px #00ffcc, 0 0 10px #00ff99, 0 0 15px #00ccff, 0 0 20px #0099ff;
    -webkit-text-stroke: 2px black; 
    font-family: 'Orbitron', sans-serif;
    letter-spacing: 3px;

}
         h2 {
    font-size: 36px; /* Bigger text */
    font-weight: bold;
    text-align: center;
    background: linear-gradient(to right, #ff6600, #ff3399); /* Gradient color */
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent; /* Makes gradient text visible */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Soft shadow for depth */
    font-family: 'Poppins', sans-serif; /* Stylish font */
    margin-bottom: 20px;
}
           @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
  </style>
</head>
<body>
<div id=container>

    <h2>Admin Home</h2>
    <div id="table"> 
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
                <th>G mail</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <%
                for (StudentDTO student : studentList) {
            %>
                <tr>
                    <td><%= student.getId() %></td>
                    <% String image = Base64.getEncoder().encodeToString(student.getPhoto().readAllBytes()); %>
                
                   <td> <img src="data:image/jpeg;base64,<%= image %>" alt="Profile" width="70" height="50">  </td> 
                    <td><%= student.getName() %></td>
                    <td><%= student.getChemistry()%></td>
                    <td><%= student.getPhysics() %></td>
                    <td><%= student.getMaths() %></td>
                    <td> <%= student.getGmail() %> </td>
                    <td>
                        <form action="EditStudent" method="post">
                           <input type="hidden" name="id" value="<%= student.getId() %>">
                           <button type="submit" id="but">Edit </button>
                        </form></td> 
                     
                    <td><form action="DeleteStudent" method="post">
                           <input type="hidden" name="id" value="<%= student.getId() %>">
                           <button type="submit" id="but2" onclick="confirmDelete()">Delete</button>
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
</div>
    <br>
        <a id="addstudent" href="add-student.jsp">Add Student</a>
        <form action="Logout" method="post">
               <button type="submit" id="lo" >Logout</button>
         </form>
          <button id="but3"><a id="a" href="adminlogin.jsp">Back</a></button>
          </div>
    <script>
    function confirmDelete() {
        if (confirm("Are you sure you want to delete this student?")) {
            
        }
    }
    </script>
</body>
</html>
