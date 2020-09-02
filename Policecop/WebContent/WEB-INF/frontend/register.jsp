<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
    <link href='css/style.css' rel='stylesheet' type='text/css'>
    <link href="../css/register.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">    
    <title>Account</title>        
    <style>
        .tabs .indicator{
            background-color: #0d47a1;
        }
        body{
            align-items: center;
            	
        }
      </style>
  </head>    
    <body>    
         <div class="row container padtop80" style="min-height:100vh">
            <div class="col m6 offset-m3 s12">
                <div class="row">
           <div class="col s12">
      <ul class="tabs">
        <li class="tab col s3"><a href="#test1" class="active blue-text text-darken-4">Login</a></li>
        <li class="tab col s3"><a href="#test2" class="blue-text text-darken-4">Register</a></li>        
      </ul>
        </div>
                </div>
            </div>
            
                <div id="test1" class="col s12 padtop40">                    
                    <div class="col m6 offset-m3 s12 z-depth-1 padtop10 " >
                    <form action="login" method="post">
                        <div class="lid">
                <div class="input-field col s12 remx">
                  <input placeholder="Placeholder" name="name" id="name" type="text" class="validate">
                  <label for="name">User Name/ Email</label>
                </div>
                <div class="input-field col s12 remx">
                  <input placeholder="Placeholder" name="pass" id="pass" type="password" class="validate">
                  <label for="pass">Password</label>
                </div>
                
                <p class="padleft10 remx" >
                    <button class="blue darken-4 btn" type=submit>Login</button>
                    
                </p>
                        </div>
                        </form>
                        
                 </div>
                </div>
    <div id="test2" class="col s12 padtop40">
       	<form action="register" method="post">
                <div class="col m6 offset-m3 s12 z-depth-1 padtop10">
                <div class="input-field col s12 ">
                  <input placeholder="Placeholder" name="firstname" id="first_name" type="text" class="validate">
                  <label for="first_name">firstname </label>
                </div>
                <div class="input-field col s12 ">
                  <input placeholder="Placeholder" name="secondname" id="secondname" type="text" class="validate">
                  <label for="secondname"> secondname </label>
                </div>          
                <div class="input-field col s12 ">
                  <input placeholder="Placeholder" name="username" id="user_name" type="text" class="validate">
                  <label for="user_name">username </label>
                </div>      
                <div class="input-field col s12 ">
                  <input placeholder="Placeholder" name="password" id="password1" type="password" class="validate">
                  <label for="password1">Password*</label>
                </div>
                <div class="input-field col s12 ">
                  <input placeholder="Placeholder" name="address" id="address" type="text" class="validate">
                  <label for="address">address</label>
                </div>
                <div class="input-field col s12 ">
                  <input placeholder="Placeholder" name="contact" id="address" type="text" class="validate">
                  <label for="contact">contact</label>
                </div>
                <p class="padleft10">
                    <button type="submit" class="blue darken-4 btn">Register</button>                    
                </p>
            </div>
           </form>  
         </div>    
     </div>         
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js">
        </script>
        <script>
    	   $( document ).ready(function(){
    	       $(".button-collapse").sideNav();
               $(".dropdown-button").dropdown();
    	       $('select').material_select(); 
               $('.slider').slider({full_width: true});
                   $(".button-collapse").sideNav();
           })
        </script>
        <script>
            $(document).ready(function(){
                $(".hid").hide();
                $("#hider").click(function(){
                    $(".remx").hide();
                    $(".hid").show();
                }); 
                $("#cancll").click(function(){
                    $(".remx").show();
                    $(".hid").hide();
                })
            });
        </script>
</body>
</html>