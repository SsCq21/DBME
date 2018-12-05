<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>pChangeJudge</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background: url(IMG/dota.jpg);background-size:cover">
    <%
    String productid=(String)session.getAttribute("productid");
    String userid=(String)session.getAttribute("userid");
    String Pid=request.getParameter("Pid");
    String Pname=request.getParameter("Pname");
    String inven=request.getParameter("inventory");
    int inventory=Integer.valueOf(inven).intValue();
    String type=request.getParameter("type");
    String pri=request.getParameter("price");
   double price=Double.valueOf(pri).doubleValue();
    String salesperson=request.getParameter("salesperson"); 
    
    try{ 
     Class.forName("com.mysql.jdbc.Driver");
     }
 catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");

String sql="select count(*) from product where Pid='"+Pid+"'";
Statement s=conn.createStatement();
ResultSet ck=s.executeQuery(sql);

if (Pid==""||Pname==""||inven==""||pri==""||salesperson==""){
out.println("Pid,Pname,inventory,price and salesperson cannot be null");
 out.println("Turn back in 3 seconds... <br><br> <a href='editProduct.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=editProduct.jsp");
}
else {
int count=0;
while (ck.next()) { count=ck.getInt(1);}
if(count!=0&&Pid.equals(productid)==false) {
out.println("The CustomerID already exises...");
 out.println("Turn back in 3 seconds... <br><br> <a href='editProduct.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=editProduct.jsp");
}
else {
String sql2="update product set Pid='"+Pid+"',Pname='"+Pname+"',inventory='"+inventory+"',type='"+type+"',price'"+price+"',salesperson='"+salesperson+"' where Pid='"+productid+"'";
Statement s2=conn.createStatement();
s2.executeUpdate(sql2);
s2.close();

out.println("Successfully updated!!");
 out.println("Turn back in 3 seconds... <br><br> <a href='editProduct.jsp'>If not, press here</a>");
 response.setHeader("refresh", "3;URL=editProduct.jsp");
}
}
    %>
  </body>
</html>
