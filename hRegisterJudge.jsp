<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.DBbean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>hRegisterJudge.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background: url(IMG/CM.jpg);background-size:cover">
     <br>
 <%
 String Cid=request.getParameter("Cid");
 String Cpwd=request.getParameter("Cpwd");
 String fname=request.getParameter("fname");
 String lname=request.getParameter("lname");
 String gender=request.getParameter("gender");
 String age2=request.getParameter("age");
 String income2=request.getParameter("income");
 String marriage=request.getParameter("marriage");
 String address=request.getParameter("add");
 String email=request.getParameter("email");
 String phone=request.getParameter("phone");
 
 
 try{ 
     Class.forName("com.mysql.jdbc.Driver");
     }
 catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");

String sql="select count(*) from customer where Cid='"+Cid+"'";
Statement s=conn.createStatement();
ResultSet ck=s.executeQuery(sql);
 //s.close();

if (Cid==""||Cpwd=="") {
out.println("ID and password cannot be null");
 out.println("Turn back in 3 seconds... <br><br> <a href='hRegister.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=hRegister.jsp");
}
else {
int count=0;
while (ck.next()) { count=ck.getInt(1);}
if(count!=0 ) {
out.println("The account already exises...");
 out.println("Turn back in 3 seconds... <br><br> <a href='hRegister.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=hRegister.jsp");
}

else {

String sql2="insert into customer values('"+Cid+"','"+Cpwd+"','"+fname+"','"+lname+"','"+address+"','home','"+email+"','"+phone+"')";
Statement s2=conn.createStatement();
s2.executeUpdate(sql2);
s2.close();

String sql3="insert into Home values ('"+Cid+"','"+gender+"','"+age2+"','"+income2+"','"+marriage+"')";
Statement s3=conn.createStatement();
s3.executeUpdate(sql3);
s3.close();

out.println("Successfully register!!");
 out.println("Turn to LOGIN in 3 seconds... <br><br> <a href='index.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=index.jsp");
}

}


 
  conn.close();  
  %>
    
  </body>
</html>
