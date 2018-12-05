<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>hPersonalJudge</title>
    
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
    String userid=(String)session.getAttribute("userid");
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
 out.println("Turn back in 3 seconds... <br><br> <a href='personal.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=personal.jsp");
}
else {
int count=0;
while (ck.next()) { count=ck.getInt(1);}
if(count!=0&&userid.equals(Cid)==false ) {
//out.println(Cid+"  "+userid);
out.println("The CustomerID already exises...");
 out.println("Turn back in 3 seconds... <br><br> <a href='personal.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=personal.jsp");
}

else {

String sql2="update customer set Cid='"+Cid+"',Cpwd='"+Cpwd+"',firstname='"+fname+"',lastname'"+lname+"',address='"+address+"',email='"+email+"',phone='"+phone+"' where Cid='"+userid+"'";
Statement s2=conn.createStatement();
s2.executeUpdate(sql2);
s2.close();

String sql3="update Home set customer='"+Cid+"',gender='"+gender+"',age='"+age2+"',income='"+income2+"',marriage'"+marriage+"' where customer='"+userid+"'";
Statement s3=conn.createStatement();
s3.executeUpdate(sql3);
s3.close();

out.println("Successfully updated!!");
 out.println("Turn back in 3 seconds... <br><br> <a href='personal.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=personal.jsp");
}

}


 
  conn.close();  
  %>
  </body>
</html>
