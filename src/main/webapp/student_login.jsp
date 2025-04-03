<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
 body {
    font-family: Arial, sans-serif;
    margin: 150px;
    background-image: url('images/login bg.jpg'); 
    background-size: 1600px 940px;
    background-position: center;
    background-repeat: no-repeat;
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
}
input, button {
    width: 100%;
    padding: 10px;
}
input[type="submit"], button {
    background: #007bff;
    color: white;
    cursor: pointer;
    margin-top: 5px;
}
input[type="submit"]:hover, button:hover {
    background: #0056b3;
}
h2 {
    background: #d9ffb3;
    color: blue;
    display: inline-block;
    text-align: center; 
    width: 360px;
    border: 2px solid red;
    padding: 10px 20px;
}
.c2 {
    width: 270px;
}
.error {
    display: inline-block;
    width: 100%;
    text-align: center;
    margin-top: 5px;
}
#but {
    padding: 10px 14px;
    text-align: center;
    text-decoration: none;
    margin: 10px 0px;
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
</head>
<body>

<div id="container">
<h2>Login Student</h2>
    <form action="LoginStudent" method="post">
        <table>
            <tr>
                <td><label for="input"> Email or ID:</label></td>
                <td class="c2"><input type="text" name="input" required></td>
            </tr>
        </table>   
        <br>

        <% String mess = (String) request.getAttribute("message"); %>
        <% if (mess != null) { %>
            <p class="error" style="color: red; text-align: center;"><%= mess %></p>
        <% } %>

        <input type="submit" value="Submit" >
        <button id="but" onclick="location.href='index.jsp'"><i class="fa-solid fa-backward"></i>&nbsp;&nbsp;&nbsp;Back</button>
    </form>
</div>

<script>
// Show error message with animation if present
document.addEventListener("DOMContentLoaded", function() {
    let errorMessage = document.querySelector(".error");
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
