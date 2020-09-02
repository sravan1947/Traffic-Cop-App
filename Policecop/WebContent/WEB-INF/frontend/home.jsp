<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl="jdbc:mysql://localhost:3306/";
String database="policcops";
String userid="root";
String password="sravan";
try{
	Class.forName(driver);
}catch (ClassNotFoundException e)
{
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" 
          content="width=device-width, initial-scale=1"> 
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<link href="bootstrap.css" rel="stylesheet" type="text/css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <style type="text/css">
      *{
      font-family: 'Varela Round', sans-serif;
      }
      h1{
      text-align: center;
      color: #fff;
      margin:0;
      }
     
      body{
      background-color: #2c3e50;
      }
      .btn{
      background-color: #2c3e50;
      }
      .btn:hover{
      background-color: #34495e;
      }
      .container{
     
      background-color:#95a5a6; 
      
      }
      
      button, input,{
      border-bottom-color: #fff !important;
      }
      .input-field>label,span{
      color: #ddd !important;
      }
      input:not([type]), input[type=text]:not(.browser-default), input[type=password]:not(.browser-default), input[type=email]:not(.browser-default), input[type=url]:not(.browser-default), input[type=time]:not(.browser-default), input[type=date]:not(.browser-default), input[type=datetime]:not(.browser-default), input[type=datetime-local]:not(.browser-default), input[type=tel]:not(.browser-default), input[type=number]:not(.browser-default), input[type=search]:not(.browser-default), textarea.materialize-textarea,input:not([type]):focus:not([readonly]), input[type=text]:not(.browser-default):focus:not([readonly]), input[type=password]:not(.browser-default):focus:not([readonly]), input[type=email]:not(.browser-default):focus:not([readonly]), input[type=url]:not(.browser-default):focus:not([readonly]), input[type=time]:not(.browser-default):focus:not([readonly]), input[type=date]:not(.browser-default):focus:not([readonly]), input[type=datetime]:not(.browser-default):focus:not([readonly]), input[type=datetime-local]:not(.browser-default):focus:not([readonly]), input[type=tel]:not(.browser-default):focus:not([readonly]), input[type=number]:not(.browser-default):focus:not([readonly]), input[type=search]:not(.browser-default):focus:not([readonly]), textarea.materialize-textarea:focus:not([readonly]){
      box-shadow: none !important;
      border-bottom:2px solid #2c3e50 !important; 
      }
      textarea.materialize-textarea{height: 6rem;}
      form{
      padding: 25px;
      }
      [type="checkbox"]:checked+span:not(.lever):before{
      border-right-color: #2c3e50;
      border-bottom-color: #2c3e50;
      }
 
  
  
    </style>
</head>

<body class="container pt-100">
 <%
   	 response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
   	if(session.getAttribute("username")==null)
   	{
   		response.sendRedirect("register.jsp");
   	}
   %>
   
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Dashboard</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="emergency.jsp">Emergency</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="fine_page.jsp">fine</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="typeofemergency.jsp">Emergency Dashboard</a>
      </li>
    </ul>
  </div>
 </nav>
<h1 >Dashboard </h1>  
<form action="" method="post">
<div class="container">
<div class="form-group"></div>
<div class="col-sm-5"></div>
<div class="input-group">
<input type="text" name="search" class="form-control" placeholder="type vehicle name">
<div class="input-group-btn" style="display: flex; justify-content: flex-end">
<button type="submit" value="search" class="btn btn-primary"><span class="glyphicon glyhicon-search"></span>Search</button>
</div>
</div>
</div>
</form>
<table border="1">
<tr>
<td>Violators Name</td>
<td>Violation Type</td>
<td>Driving License</td>
<td>Vehicle Details</td>
<td>Date and Time</td>
<td>Fine Amount</td>
<td>Location</td>
<td>Vehicle Number</td>
<td>Email</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from fine where vehicle_number='"+request.getParameter("search")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("violation_name") %></td>
<td><%=resultSet.getString("violation_type") %></td>
<td><%=resultSet.getString("driving_license") %></td>
<td><%=resultSet.getString("vehicle_details") %></td>
<td><%=resultSet.getString("date_and_time") %></td>
<td><%=resultSet.getString("fine_amount") %></td>
<td><%=resultSet.getString("location") %></td>
<td><%=resultSet.getString("vehicle_number") %></td>
<td><%=resultSet.getString("email") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>