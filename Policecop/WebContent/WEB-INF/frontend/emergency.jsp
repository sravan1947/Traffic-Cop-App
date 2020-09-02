<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Registration Form Fine</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
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
      padding: 20px;
      background-color:#95a5a6; 
      margin-top: 30px;
      margin-bottom: 30px;
      }
      .mb-0{
      margin-bottom: 0;
      }
      .mt-25{
      margin-top: 25px;
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
  <body>
   <%
   	 response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
   	if(session.getAttribute("username")==null)
   	{
   		response.sendRedirect("register.jsp");
   	}
   %>
    <header>
      <h1>Traffic Violations Forms</h1>
    </header>
    <div class="container pt-60">
      <div class="row">
        <form class="col s12" action="emergency" method="post">
          <div class="row">
            <div class="input-field col s6">
              <input list="location" name="location" type="text" class="validate">
              <label for="location">Register the location</label>
              <datalist id="location" >
               <option value="kukatpally">
               <option value="hitechcity">
               <option value="gachiboli">
              </datalist>
            </div>
            <div class="input-field col s6">
              <input name="voilation_type" id="voilation_type" type="text" class="validate">
              <label for="type">Type of emergency</label>
            </div>
          </div>
            <div class="input-field col s6">
              <input name="affected" id="affected" type="text" class="validate">
              <label for="c_pass">No of People who got effected</label>
            </div>
            <div class="input-field col s6">
              <input name="Phone_no" id="Phone no" type="text" class="validate">
              <label for="c_pass">Phone no</label>
            </div>
         
          <div class="row">
            <div class="col s12 mt-25"> 
              <button class="btn waves-effect waves-light pulse" type="submit"> SOS
              </button>
            </div>
          </div>
          
        </form>
      </div>
    </div>
  </body>
</html>