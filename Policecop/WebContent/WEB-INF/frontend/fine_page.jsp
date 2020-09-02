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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
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
        <form class="col s12" action="fine" method="post">
          <div class="row">
            <div class="input-field col s6">
              <input  name="violation_name" type="text" class="validate">
              <label for="violation name">person name</label>
            </div>
            <div class="input-field col s6">
              <input name="violation_type" id="last_name" type="text" class="validate">
              <label for="last_name">violation type</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s6">
              <input name="driving_license" type="text" class="validate">
              <label >driving license</label>
            </div>
            <div class="input-field col s6">
             
              <label for="c_pass">vehicle details</label>
               <input list="vehicle details" name="vehicle details" type="text" class="validate">
              
	              <datalist id="vehicle details" >
	               <option value="car">
	               <option value="Bike">
	               <option value="Lorry">
	               <option value="Auto">
	              </datalist>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">

              <input name="dateandtime" type="text" id="datepicker">
              <label for="email">date and time</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input name="amount" id="email" type="text" class="validate">
              <label for="email">fine amount</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input name="location" id="email" type="text" class="validate">
              <label for="email">location</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input name="vechiclenumber"  type="text" class="validate">
              <label for="email">vehicle number</label>
            </div>
          </div>
            <div class="row">
            <div class="input-field col s12">
              <input name="email"  type="text" class="validate">
              <label for="email">email</label>
            </div>
          </div>
          <div class="row">
            <div class="col s12 mt-25"> 
              <button class="btn waves-effect waves-light pulse" type="submit"> Submit
              <i class="material-icons right">send</i>
              </button>
             <button class="btn waves-effect waves-light pulse"><a href="emergency.jsp" type="submit"> Emeregency
              <i class="material-icons right">send</i>
              </a>
              </button> 
            </div>
          </div>
          <script>
			  $( function() {
			    $( "#datepicker" ).datepicker();
			  } );
		  </script>
        </form>
      </div>
    </div>
  </body>
</html>