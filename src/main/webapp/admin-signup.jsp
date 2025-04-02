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
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);

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
          .password-match {
            font-size: 14px;
            margin-top: 5px;   
            font-weight: bold;
            text-align:center;
        }

        .password-match.error {
            color: red;
        }

        .password-match.success {
            color: green;
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
     <td><input type="tel" name="contact" placeholder="+91 234-567-8901" pattern="[0-9]{10}" required></td>
</tr>
<tr>
     <td><label for="gmail">Gmail :</label></td>
     <td><input type="email" name="gmail"  placeholder="example@gmail.com" required></td>
</tr>
<tr>
     <td><label for="pass1">PassWord :</label></td>
     <td><input type="password" placeholder="Enter Password" name="pass1" id="one" required></td>
</tr>
<tr>
     <td><label for="pass2">RE-PassWord :</label></td>
     <td><input type="password" placeholder="Enter RE Password" name="pass2" id="two" onkeyup="passwordCheck()" required></i></td>
     <td> <i class="fa-solid fa-eye-slash" id="eye"> <td>
     
</tr>
</table>
                   <p class="password-match" id="passwordMessage"></p>
     
     <input type="submit" value="Submit">
</form>
     <button id="but2"><a href="adminlogin.jsp">Back</a></button>
  
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

   // check eye  
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
     
function passwordCheck() {
    const pass = document.getElementById("one").value;
    const repass = document.getElementById("two").value;
    const message = document.getElementById("passwordMessage");

    if (pass.length < 6) {
        message.textContent = "Password must be at least 6 characters.";
        message.className = "password-match error";
    } else if (pass !== repass) {
        message.textContent = "Passwords do not match ❌";
        message.className = "password-match error";
    } else {
        message.textContent = "Passwords match ✅";
        message.className = "password-match success";
    }
}

</script>

</body>
</html>