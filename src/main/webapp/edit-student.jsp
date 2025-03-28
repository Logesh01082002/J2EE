<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="StudentDAO.StudentDAO, StudentDTO.StudentDTO, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f4f4f4;
        }
        #container {
            background: white;
            padding: 20px;
            max-width: 300px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label, input {
            display: block;
            margin-top: 10px;
        }
        input ,button{
            width: 100%;
            padding: 8px;
        }
        input[type="submit"],button {
            background: #007bff;
            color: white;
            cursor: pointer;
            margin-top: 5px;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        button:hover {
            background: #0056b3;
        }
        h2{
          background: #d9ffb3;
          color:blue;
          display: inline-block;
          width: 150px;
          border:2px solid red;
          border-radius:20px;
          padding:10px 75px;
        }
         a{
        background: #d9ffb3;
        border:2px solid red;
         border-radius:20px;
         padding:10px 20px;
         text-decoration: none;
         position:relative;
         }
         .c2{
         width:270px;}
         h2{
         color:Blue;}
         #eye{
          position: relative;
          left:40px;
          top:8px;
         }
    </style>
</head>
<body>

<% StudentDTO s=(StudentDTO)request.getAttribute("student");   
  %>
<div id="container">
<h2> Edit Student</h2>
    <form action="UpdateStudent" method="post">    
<table>
<tr>
      <td><label for="id">ID :</label></td>
      <td><input type="number" name="id" required value="<%= s.getId() %>" readonly></td>
</tr>
<tr>
      <td><label for="name">Name :</label></td>
      <td><input type="text" name="name" required value="<%= s.getName() %>"></td> 
</tr>
<tr>
     <td><label for="physics">Physics :</label></td>
     <td><input type="number" name="physics" required value="<%= s.getPhysics() %>"></td>
</tr>
<tr>
     <td><label for="chemistry">Chemistry :</label></td>
     <td><input type="number" name="chemistry" required value="<%= s.getChemistry() %>"></td>
</tr>
<tr>
     <td><label for="maths">Maths :</label></td>
     <td><input type="number"  name="maths" required value="<%= s.getMaths() %>"></td>
</tr>
</table>
     <br>
     <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>