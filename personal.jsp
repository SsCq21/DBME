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
    
    <title>Personal</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
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
  <div class=right>
   <a href="main.jsp"><h21>Home</h21></a>
   </div>
    <div class="text-center"> 
            <h1 style="text-align:center"><%=session.getAttribute("userid")%>-Personal</h1>
    </div>
        
       <p style="margin:50px"></p> 
  <%
  try{ 
     Class.forName("com.mysql.jdbc.Driver");
     }
 catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");
Statement s=conn.createStatement();
String Cid=(String)session.getAttribute("userid");

String sql1="select Cpwd from customer where Cid='"+Cid+"'";
ResultSet rs1=s.executeQuery(sql1);
String Cpwd=null;
while(rs1.next()) {
Cpwd=rs1.getString("Cpwd");
}

String sql2="select firstname from customer where Cid='"+Cid+"'";
ResultSet rs2=s.executeQuery(sql2);
String fname=null;
while(rs2.next()) {
fname=rs2.getString("firstname");
}

String sql3="select lastname from customer where Cid='"+Cid+"'";
ResultSet rs3=s.executeQuery(sql3);
String lname=null;
while(rs3.next()) {
lname=rs3.getString("lastname");
}

String sql4="select address from customer where Cid='"+Cid+"'";
ResultSet rs4=s.executeQuery(sql4);
String address=null;
while(rs4.next()) {
address=rs4.getString("address");
}

String sql5="select kind from customer where Cid='"+Cid+"'";
ResultSet rs5=s.executeQuery(sql5);
String kind=null;
while(rs5.next()) {
kind=rs5.getString("kind");
}

String sql6="select email from customer where Cid='"+Cid+"'";
ResultSet rs6=s.executeQuery(sql6);
String email=null;
while(rs6.next()) {
email=rs6.getString("email");
}

String sql7="select phone from customer where Cid='"+Cid+"'";
ResultSet rs7=s.executeQuery(sql7);
String phone=null;
while(rs7.next()) {
phone=rs7.getString("phone");
}

String sql8="select gender from home where customer='"+Cid+"'";
ResultSet rs8=s.executeQuery(sql8);
String gender=null;
while(rs8.next()) {
gender=rs8.getString("gender");
}

String sql9="select age from home where customer='"+Cid+"'";
ResultSet rs9=s.executeQuery(sql9);
String age=null;
while(rs9.next()) {
age=rs9.getString("age");
}

String sql10="select income from home where customer='"+Cid+"'";
ResultSet rs10=s.executeQuery(sql10);
String income=null;
while(rs10.next()) {
income=rs10.getString("income");
}

String sql11="select marriage from home where customer='"+Cid+"'";
ResultSet rs11=s.executeQuery(sql11);
String marriage=null;
while(rs11.next()) {
marriage=rs11.getString("marriage");
}





conn.close();



   %>  
   
      
       <div  align="center" >
     <form method="POST" action="hPersonalJudge.jsp" onsubmit="return check()">
     <div class="row" >
     <div class="col-md-6 text-center">

   <h3>CustomerID：<input type="text" name="Cid" id="Cid" value="<%=session.getAttribute("userid")%>" size="20"> </h3>
    <h3>Password：<input type="password" name="Cpwd" id="Cpwd" value="<%=Cpwd %>" size="20" ></h3>
    <h3>Firstname:<input type="text" name="fname" id="fname" value="<%=fname %>" size="20"></h3>
    <h3>Lastname:<input type="text" name="lname" id="lname" value="<%=lname %>" size="20"></h3>
   
   <h3>Gender：
   <%if(gender==null) { %><input type="radio" name="gender" id="gender" value="male">Male&nbsp;&nbsp;
   <input type="radio" name="gender" id="gender" value="female" >Female</h3><%} else { %>
   <%if(gender.equals("male")) {%><input type="radio" name="gender" id="gender" value="male" checked>Male&nbsp;&nbsp;<%}
   else { %> <input type="radio" name="gender" id="gender" value="male">Male&nbsp;&nbsp;
   <% }
   if(gender.equals("female")) {%><input type="radio" name="gender" id="gender" value="female" checked>Female</h3><%}
   else { %><input type="radio" name="gender" id="gender" value="female" >Female</h3>
   <%} }%>
   
   </div>
   <div class="col-md-6 text-center">
    <h3>Age:<input type="text" name="age" id="age" value="" size="20">
    <h3>Income:<input type="text" name="income" id="income" value="<%=income %>" size="20">
    <h3>E-mail:<input type="text" name="email" id="email" value="<%=email %>" size="20">
    <h3>Phone:<input type="text" name="phone" id="phone" value="<%=phone %>" size="20">
    
     <h3>Marriage：
     <%if(marriage==null) { %><input type="radio" name="marriage" value="single" >Single&nbsp;&nbsp; 
     <input type="radio" name="marriage" value="married">Married</h3> <%} else { %>
    <%if(marriage.equals("single")) {%> <input type="radio" name="marriage" value="single" checked>Single&nbsp;&nbsp;<%}
    else {%><input type="radio" name="marriage" value="single" >Single&nbsp;&nbsp; 
    <%}
    if (marriage.equals("married")) {%><input type="radio" name="marriage" value="married" checked>Married</h3><br><%}
    else { %><input type="radio" name="marriage" value="married">Married</h3>
    <%} }%>
    
     <h3>Address:<input type="text" name="add" id="add" value="<%=address %>" size="50"></h3> 
     </div> </div>
                               
    <input type=submit  value="Update" >
    <input type=reset value="Clear"><br><br>
  </form>
   </div>
   
  </body>
  </body>
</html>
