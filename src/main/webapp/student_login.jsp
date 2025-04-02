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
              background-size: cover;
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
         
    </style>

</style>
</head>
<body>

<div id="container">
<h2>Admin Login</h2>
    <form action="LoginAdmin" method="post">
        <table>
            <tr>
                <td><label for="gmail"> Email:</label></td>
                <td class="c2"><input type="text" name="gmail" required></td>
            </tr>
            <tr>
                <td><label for="password"> Password:</label></td>
                <td class="c2" ><input type="password" id="pass" name="password" required></td>
                <td> <i class="fa-solid fa-eye-slash" id="eye"></i> <td>
            </tr>
        </table>   
        </br>
        
         <% String mess = (String) request.getAttribute("message"); %>
    <% if (mess != null) { %>
        <p class="error" style="color: red; text-align: center;"><%= mess %></p>
    <% } %>

    <% String mess1 = (String) request.getAttribute("message1"); %>
    <% if (mess1 != null) { %>
        <p class="error" style="color: red; text-align: center;"><%= mess1 %></p>
    <% } %>
        <input type="submit" value="Submit">
        <br>
        <button><a href="admin-signup.jsp">Sign up</a></button>
    </form>

</div>
<script>

//Password visibility toggle
var icon = document.getElementById("eye");
var pass1 = document.getElementById("pass");

icon.addEventListener("click", function() {
    if (pass1.type === "password") 
    {
        pass1.type = "text";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    } else {
        pass1.type = "password";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    }
});

</script>
</body>
</html>