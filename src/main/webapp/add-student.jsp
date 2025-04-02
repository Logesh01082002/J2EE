<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> add student </title>
</head>
<style>
 body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background: linear-gradient(to right, #84fab0, #8fd3f4);


        }
        #container {
            background: white;
            padding: 20px;
            max-width: 380px;
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
          width: 160px;
          border:2px solid red;
          border-radius:10px;
        
          padding:10px 110px;
        }
                a{
         color:white;
         padding:10px 20px;
         text-decoration: none;

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
<body>


<div id="container">
<h2> Add Student </h2>
<form action="AddStudent" method="post" enctype="multipart/form-data">
   
<table>
<tr>
      <td><label for="id">ID :</label></td>
      <td><input type="number" name="id" required></td>
</tr>
<tr>
      <td><label for="name">Name :</label></td>
      <td><input type="text" name="name" required></td> 
</tr>
<tr>
     <td><label for="physics">Physics :</label></td>
     <td><input type="number" name="physics" required></td>
</tr>
<tr>
     <td><label for="chemistry">Chemistry:</label></td>
     <td><input type="number" name="chemistry" required></td>
</tr>
<tr>
     <td><label for="maths">Maths :</label></td>
     <td><input type="number"  name="maths" required></td>
</tr>
<tr>
     <td><label for="gmail">Gmail :</label></td>
     <td><input type="email"  name="gmail" required></td>
</tr>
<tr>
    <td> <label for="photo">Photo:</label></td>
    <td> <input type="file" name="photo" accept="image/*" ></td>
</tr>

</table>
     <br>
     <input type="submit" value="Submit">
     <button><a href="adminhome.jsp">Back</a></button>
      <% String del = (String) request.getAttribute("delete"); %>
    <% if (del != null) { %>
        <p class="mess" style="color: red; text-align: center;"><%= del %></p>
    <% } %>
    
    
</form>
</div>
</body>
</html>