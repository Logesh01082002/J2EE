<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="StudentDAO.StudentDAO, StudentDTO.StudentDTO, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 90vh;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);

        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }
        .profile-img {
            width: 300px;
            height: 300px;
            border-radius: 50%;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
            font-size: 16px;
        }
        .key {
            font-weight: bold;
            text-align: right;
            width: 40%;
            color: #333;
        }
        .value {
            text-align: left;
            color: #555;
        }
        .info {
            font-size: 16px;
            color: #333;
            margin: 5px 0;
        }
        .info strong {
            color: #007BFF;
        }
        h3{
        margin:0px -20px;
        margin-bottom:10px;
        color:blue;
        
        background-color:#ffcccc;
        padding:10px;	
        }
        a{
        text-decoration:none;
        }
        button{
        position:relative;
        left:-150px;
        padding: 10px 14px;
        text-align: center;
        text-decoration: none;
        font-size: 16px;
        }
    </style>
<body>

<%
    // Retrieve student object from session
    StudentDTO student = (StudentDTO) session.getAttribute("student");  %>

       <% if (student != null) { %> 
           
     <div class="card">
     <h3>Student Marks</h3>
        <% String image = Base64.getEncoder().encodeToString(student.getPhoto().readAllBytes()); %>    
        <img src="data:image/jpeg;base64,<%= image %>" class="profile-img" alt="Profile" width="70" height="50">  
        
        <table>
            <tr>
                <td class="key">ID :</td>
                <td class="value"><%= student.getId() %></td>
            </tr>
            <tr>
                <td class="key">Name :</td>
                <td class="value"><b><%= student.getName() %></b></td>
            </tr>
            <tr>
                <td class="key">Chemistry :</td>
                <td class="value"><%= student.getChemistry() %></td>
            </tr>
            <tr>
                <td class="key">Physics :</td>
                <td class="value"><%= student.getPhysics() %></td>
            </tr>
            <tr>
                <td class="key">Maths :</td>
                <td class="value"><%= student.getMaths() %></td>
            </tr>
            <tr>
                <td class="key">Email :</td>
                <td class="value"><%= student.getGmail() %></td>
            </tr>
        </table>
        
        <button><a href="student_login.jsp">back</a></button>
    </div>
    
    
    

<% } else { %>
    <p style="color: red;">Student details not found. Please log in again.</p>
<% } %>
</body>
</html>