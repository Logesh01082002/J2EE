<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>student login page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
 body {
            font-family: Arial, sans-serif;
            margin: 150px;
             background-image: url('images/login bg.jpg'); 
              background-size: 1500px 820px;
             background-position: center;
              background-repeat: no-repeat;
        }
        #container {
            background: white;
            padding: 20px;
            max-width: 400px;
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
        input[type="submit"],button{
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
        a:hover{
        background: #0056b3;
        }
        a{
         cursor: pointer;
          text-decoration: none;
          color: white;
        }
        h2{
          background: #d9ffb3;
          color:blue;
          display: inline-block;
          text-align: center; 
          width: 360px;
          border:2px solid red;
          padding:10px 20px;
        }
            
         .c2{
         width:270px;}
         .error{
            display: inline-block;
            width: 300px;
            position:relative;
            left:60px;
            top:5px;
         }
         #eye{
          position:relative;
          left:30px;
          top:6px;
         }
          #but{
        
        padding: 10px 14px;
        text-align: center;
        text-decoration: none;
        margin:10px 0px;
   
        }
         
    </style>

</style>
</head>
<body>

<div id="container">
<h2>Login Student </h2>
    <form action="LoginStudent" method="post">
        
        <table>
            <tr>
                <td><label for="input"> Email or ID:</label></td>
                <td class="c2"><input type="text" name="input" required></td>
            </tr>
        </table>   
        </br>
        
         <% String mess = (String) request.getAttribute("message"); %>
    <% if (mess != null) { %>
        <p class="error" style="color: red; text-align: center;"><%= mess %></p>
      
    <% } %>

        <input type="submit" value="Submit">
        
         <button id="but"><a href="index.jsp">back</a></button>
        <br>
    </form>

</div>
</body>
</html>