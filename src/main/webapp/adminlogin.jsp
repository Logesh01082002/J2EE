<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin login page</title>
<style>
 body {
            font-family: Arial, sans-serif;
            margin: 150px;
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
    </style>

</style>
</head>
<body>

<div id="container">

<form action="LoginAdmin" method="post">
<table>
<tr>
    <td> <label for="gmail"> Email:      </label> </td>
    <td class="c2"> <input type="text" name="gmail" required></td>
</tr>
<tr>
     <td> <label for="password"> PassWord :</label> </td>
     <td class="c2"> <input type="text" name="password" required></td>
</tr>
</table>   <br>

<input type="submit" value="submit">
   <br>
            <button type="button" onclick="window.location.href='admin-signup.jsp'">Sign Up</button>

</form>

</div>
</body>
</html>