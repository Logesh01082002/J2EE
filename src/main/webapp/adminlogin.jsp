<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin login page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
 body {
            font-family: Arial, sans-serif;
              background: linear-gradient(to right, #74ebd5, #acb6e5); 
             display: flex;
             padding-left:170px;
             justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            animation: fadeIn 0.8s ease-in-out;
        }
        #container {
            background: white;
            padding: 20px;
            max-width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: slideDown 0.6s ease-in-out;
        }
        label, input {
            display: block;
            margin-top: 10px;
            transition: border 0.3s ease-in-out;
        }
        input ,#but{
            width: 100%;
            padding: 8px;
             transition: color 0.3s ease-in-out;
        }
        input[type="submit"],button{
            background: #007bff;
            color: white;
            cursor: pointer;
            margin-top: 5px;
        }
         input:focus {
            outline: none;
            border-color: #007BFF;
            box-shadow: 0px 0px 8px rgba(0, 123, 255, 0.5);
             transition: color 0.3s ease-in-out;
        }
        input[type="submit"]:hover {
            background: #0056b3;
             transition: color 0.3s ease-in-out;
        }
        #but:hover {
            background: #0056b3;
             transform: scale(1.05);
              transition: color 0.3s ease-in-out;
        }
        a:hover{
        background: #0056b3;
         transition: color 0.3s ease-in-out;
        }
        a{
         cursor: pointer;
          text-decoration: none;
          color: white;
          padding:8px 28px;
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
            
            position:relative;
            left:10px;
            top:5px;
            color: red;
            font-size: 20px;
            margin-top: 10px;
            display: none;
         }
         
         #eye{
          position:relative;
          left:30px;
          top:6px;
         }
         #but2{
         position:relative;
         left:-610px;
         top:220px;
         padding:10px 15px;
         background-color:grey;
          transition: background 0.3s ease-in-out, transform 0.2s;
         }
          /* Animations */
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

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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
                <td class="c2"><input type="text" name="gmail" required placeholder="enter gmail"></td>
            </tr>
            <tr>
                <td><label for="password"> Password:</label></td>
                <td class="c2" ><input type="password" id="pass" name="password" placeholder="enter password" required></td>
                <td> <i class="fa-solid fa-eye-slash" id="eye"></i> </td>
            </tr>
        </table>   
        </br>
        
         <% String mess = (String) request.getAttribute("message"); %>
    <% if (mess != null && !mess.trim().isEmpty()) { %>
        <p id="errorMessage" class="error" style="color: red; text-align: center;"><%= mess %></p>
    <% } %>

        <input type="submit" value="Submit">
        <br>
        <button id="but"><a href="admin-signup.jsp">Sign up</a></button>
    </form>
</div>
       <button id="but2"><a href="index.jsp">Back</a></button>
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

// Show error message with animation if present
document.addEventListener("DOMContentLoaded", function() {
    let errorMessage = document.getElementById("errorMessage");
    if (errorMessage && errorMessage.innerText.trim() !== "") {
        errorMessage.style.display = "block";  // Show error message
        setTimeout(function() {
            errorMessage.style.display = "none"; // Hide error message after 5 seconds
        }, 5000);
    }
});

</script>
</body>
</html>