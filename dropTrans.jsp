<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.transactions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Drop Transactions</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body  style="background: url(IMG/dota.jpg);background-size:cover">
    This is my JSP page. <br>
    <%     
   ArrayList translist=(ArrayList)session.getAttribute("translist");
  transactions t=(transactions)translist.get(0);
  String Tid=t.getTid();
  
  try {
Class.forName("com.mysql.jdbc.Driver");
}
catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");
Statement s=conn.createStatement();

String sql="delect from transactions where Tid="+Tid+"'";

out.println("ID: "+Tid+"--Drop successfully!!!");
 out.println("Turn back in 3 seconds... <br><br> <a href='salesTrans.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=salesTrans.jsp");
 
  
  %>
    
  </body>
</html>
