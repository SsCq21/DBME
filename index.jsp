<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Index</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <link href="CSS/menu.css" rel="stylesheet" type="text/css"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
            function check(){
	var uname = document.getElementById("userid").value;
	var upassword = document.getElementById("password").value;
	if(uname==""){
		alert("Userid cannot be null！");
		return false;
	}
	if(upassword==""){
		alert("Password cannot be null！");
		return false;
	}
        }
        
</script>
  </head>
  
  <body style="background: url(IMG/CM.jpg);background-size:cover">
  
    <div class="text-center"> 
            <h1 style="text-align:center">SXWBuy</h1>
    </div>
        
       <p style="margin:80px"></p> 
       
       
             <div class="row" style="margin-top:30px;"> 
             <div class="col-md-2 text-center">.</div>
             <div class="col-md-6 text-center">
             <table border=0 width=100%><tr>
        <form action="LoginJudge.jsp" method="post" onsubmit="return check()">
        <table border="0" width=100%>
           <tr>
               <td align="center"><h3>UserID:</h3></td>
             <td><input type="text" id="userid" name="userid" style="width: 180px"/></td>
           </tr>
           <tr>
               <td align="center"><h3>Password:</h3></td>
             <td><input type="password" id="password" name="password" style="width: 180px"/></td>
           </tr>
           <tr>
               <td align="center"><input type="submit" value="login"/></td>
             <td ><input type="reset" value="reset"/></td>           
           </tr>
              
        </table></form></tr>
        </table>
        </div>
        <div class="col-md-4 text-center">
        <a href="hRegister.jsp"><h4 class="btn btn-info">HomeRegister</h4></a>
        <a href="#"><h4 class="btn btn-success">BusinessRegister</h4></a>
        </div>
        </div>
        
    
                  

  </body>
</html>
