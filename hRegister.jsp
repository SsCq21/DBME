<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.DBbean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>hRegister</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
            function check(){
	var Cid = document.getElementById("Cid").value;
	var Cpwd = document.getElementById("Cpwd").value;
	if(Cid==""){
		alert("Userid cannot be null！");
		return false;
	}
	if(Cpwd==""){
		alert("Password cannot be null！");
		return false;
	}
	
    }
        </script>

  </head>
  
  <body style="background: url(IMG/CM.jpg);background-size:cover">
  
    <div class="text-center"> 
            <h1 style="text-align:center">SXWBuy-HomeRegister</h1>
    </div>
        
       <p style="margin:50px"></p> 
       
       <div align="center" style="margin-top:30px;">
     <form method="POST" action="hRegisterJudge.jsp" onsubmit="return check()">
   
   <h3>CustomerID：<input type="text" name="Cid" id="Cid" value="" size="20"> </h3>
    <h3>Password：<input type="password" name="Cpwd" id="Cpwd" value="" size="20" ></h3>
    <h3>Firstname:<input type="text" name="fname" id="fname" value="" size="20"></h3>
    <h3>Lastname:<input type="text" name="lname" id="lname" value="" size="20"></h3>
   <h3>Gender：<input type="radio" name="gender" id="gender" value="male" >Male&nbsp;&nbsp;
               <input type="radio" name="gender" id="gender" value="female" >Female</h3>
    <h3>Age:<input type="text" name="age" id="age" value="" size="20"><br><br> 
    <h3>Income:<input type="text" name="income" id="income" value="" size="20"><br><br> 
    <h3>E-mail:<input type="text" name="email" id="email" value="" size="20"><br><br> 
    <h3>Phone:<input type="text" name="phone" id="phone" value="" size="20"><br><br> 
     <h3>Marriage：<input type="radio" name="marriage" value="single" >Single&nbsp;&nbsp;
                        <input type="radio" name="marriage" value="married">Married</h3> 
     <h3>Address:<input type="text" name="add" id="add" value="" size="50"></h3>                          
    <input type=submit value="Register" >
    <input type=reset value="Clear"><br><br>
  </form>
   </div>
   
  </body>
</html>
