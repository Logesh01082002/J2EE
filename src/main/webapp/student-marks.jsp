<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="StudentDAO.StudentDAO, StudentDTO.StudentDTO, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        background: linear-gradient(135deg, #667eea, #764ba2);
    }
    .card {
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        width: 400px;
        text-align: center;
        transition: transform 0.3s ease;
    }
    .card:hover {
        transform: translateY(-5px);
    }
    .profile-img {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        margin-bottom: 15px;
        border: 5px solid #764ba2;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }
    td {
        padding: 12px;
        font-size: 16px;
    }
    .key {
        font-weight: bold;
        text-align: right;
        width: 40%;
        color: #333;
    }
    .value {
        text-align: left;
        color: #555;
    }
    tr:nth-child(even) {
        background-color: #f3f3f3;
    }
    h3 {
        margin: -25px -25px 15px -25px;
        padding: 15px;
        background-color: #ff6b6b;
        color: white;
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
        font-size: 20px;
    }
    a {
        text-decoration: none;
        color: white;
    }
    button {
        margin-top: 15px;
        padding: 10px 16px;
        font-size: 16px;
        background-color: #007BFF;
        border: none;
        border-radius: 6px;
        color: white;
        cursor: pointer;
        transition: background 0.3s ease;
    }
    button:hover {
        background-color: #0056b3;
    }
    .msgs {
	text-align: center;
	font-weight: bold;
	display: none;
	margin-top: 10px;
	font-size: 15px;
}
</style>
</head>
<body>

<%
    StudentDTO student = (StudentDTO) session.getAttribute("student");  
%>

<% if (student != null) { %> 

    <div class="card">
        <h3>Student Marks</h3>
        <% String image = Base64.getEncoder().encodeToString(student.getPhoto().readAllBytes()); %>    
        <img src="data:image/jpeg;base64,<%= image %>" class="profile-img" alt="Profile">  
        
        <% double percentage = ((student.getPhysics() + student.getChemistry() + student.getMaths()) * 100) / 300; %>
        
        <table>
            <tr>
                <td class="key">ID :</td>
                <td class="value"><%= student.getId() %></td>
            </tr>
            <tr>
                <td class="key">Name :</td>
                <td class="value"><b><%= student.getName() %></b></td>
            </tr>
            <tr>
                <td class="key">Chemistry :</td>
                <td class="value"><%= student.getChemistry() %></td>
            </tr>
            <tr>
                <td class="key">Physics :</td>
                <td class="value"><%= student.getPhysics() %></td>
            </tr>
            <tr>
                <td class="key">Maths :</td>
                <td class="value"><%= student.getMaths() %></td>
            </tr>
            <tr>
                <td class="key">Percentage :</td>
                <td id ="percentage" class="value"><%= String.format("%.2f", percentage) + " %" %></td>
            </tr>
            <tr>
                <td class="key">Email :</td>
                <td class="value"><%= student.getGmail() %></td>
            </tr>
        </table>
        <p id="msg1" class="msgs" style="color: green">"Great job! "</p>
		<p id="msg2" class="msgs" style="color: blue">"Nice progress! Keep
			improving."</p>
		<p id="msg3" class="msgs" style="color: red">"You can bounce back!
			just keep going!"</p>
        
        <button><a href="student_login.jsp">Back</a></button>
    </div>

<% } else { %>
    <p style="color: red; font-size: 18px;">Student details not found. Please log in again.</p>
<% } %>

<script type="text/javascript">
		var percentage = document.getElementById("percentage");
		var msg1 = document.getElementById("msg1");
		var msg2 = document.getElementById("msg2");
		var msg3 = document.getElementById("msg3");

		if (percentage) {
			var percent = parseInt(percentage.innerText);
			if (percent > 80) {
				msg1.style.display = "block";
			}
			else if (percent >= 40 && percent <= 80) {
				msg2.style.display = "block";
			}
			else if (percent <= 40) {
				msg3.style.display = "block";
			}
		}
		
		function goback()
		{
			window.location.href = "studentlogin.jsp";
		}
	</script>

</body>
</html>
