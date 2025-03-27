<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<style>
 body {
            padding:50px;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }
        h1 {
            color: #333;
        }
        #container {
            background: white;
            padding: 20px;
            max-width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        a {
            display: block;
            padding: 15px;
            margin: 10px;
            font-size: 18px;
            color: white;
            background: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        a:hover {
            background: #0056b3;
        }
        h2{
          background: #d9ffb3;
          color:blue;
          display: inline-block;
          width: 500px;
          border:2px solid red;
          border-radius:30px;
          padding:20px;
        }
  </style>
</head>

<body>
<h2> Student Management System</h2>

<div id="container">
<a href="adminlogin.jsp"> ADMIN</a>
<a href="findStudent.html"> STUDENT</a>
</div>

</body>
</html>