<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin signup</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
</head>
<style>
 body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f4f4f4;
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
          width: 300px;
          border:2px solid red;
          border-radius:20px;
          position:relative;
          left:470px;
          padding:10px 20px;
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
<body>
<h2>   Admin Sign-up Page</h2>
<div id="container"> 

<form action="adminSignUp" method="post" onsubmit="return validatePasswords()">

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
     <td><label for="contact">Contact :</label></td>
     <td><input type="number" name="contact" required></td>
</tr>
<tr>
     <td><label for="gmail">Gmail :</label></td>
     <td><input type="text" name="gmail" required></td>
</tr>
<tr>
     <td><label for="pass1">PassWord :</label></td>
     <td><input type="password" placeholder="Enter Password" name="pass1" id="one" required></td>
</tr>
<tr>
     <td><label for="pass2">RE-PassWord :</label></td>
     <td><input type="password" placeholder="Enter RE Password" name="pass2" id="two" required></i></td>
     <td> <i class="fa-solid fa-eye-slash" id="eye"> <td>
</tr>
</table>
     <br>
     <input type="submit" value="Submit">
</form>
  
</div>

<script>
     // verify the both passwords are crt 
function validatePasswords() {
    var pass1 = document.getElementById("one").value;
    var pass2 = document.getElementById("two").value;

    if (pass1 !== pass2) {
        alert("Passwords does not match! Please enter again.");
        return false; 
    }
    return true; 
}

   // check both passwords are crt
var icon = document.getElementById("eye");
icon.addEventListener("click", function() {
    var pass1 = document.getElementById("one");
    var pass2 = document.getElementById("two");

    
    if (pass1.type === "password" && pass2.type === "password") {
        pass1.type = "text";
        pass2.type = "text";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    } else {
        pass1.type = "password";
        pass2.type = "password";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    }
});



</script>

</body>
</html>