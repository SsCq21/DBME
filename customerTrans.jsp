<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.product" import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>CustomerTransactions</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<link href="CSS/menu.css" rel="stylesheet" type="text/css"/>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background: url(IMG/CM.jpg);background-size:cover">
  <div class=right>
    <a href="main.jsp"><h21>HOME</h21></a>
     <a href="index.jsp"><h21>LogOut</h21></a>
     </div>       
         
         <div class="text-center">
            <h1 style="text-align:center"><%=session.getAttribute("userid")%>-TransactionsRecord</h1>
    </div>
    <p style="margin:20px"></p> 
    
 <%
  String cid=(String)session.getAttribute("userid");
try {
Class.forName("com.mysql.jdbc.Driver");
}
catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");
Statement s=conn.createStatement();

String sql="select Tid,date,quantity,product,salesperson from Transactions where customer='"+cid+"'";
ResultSet ck=s.executeQuery(sql);

 %> 
 
 <div align="center">
<table class="table table-bordered margin-top:-50px" width=100% align=center >
<thead><tr class="active">
<td align="center"><h4>Tid</h4></td>
<td align="center"><h4>Date</h4></td>
<td align="center"><h4>Quantity</h4></td>
<td align="center"><h4>Product</h4></td>
<td align="center"><h4>Salesperson</h4></td>
</tr></thead>

<% 

int i=0;
while(ck.next()) {
String tid=ck.getString("Tid");
Date date=ck.getDate("date");
int quantity=ck.getInt("quantity");
String pid=ck.getString("product");
String sid=ck.getString("salesperson");
%>

<tbody><tr>
<td align="center" ><h4><%=tid %></h4></td>
<td align="center"><h4><%=date %></h4></td>
<td align="center"><h4><%=quantity %></h4></td>
<td align="center"><h4><%=pid %></h4></td>
<td align="center"><h4><%=sid %></h4></td>
</tr></tbody>
<% i=i+1;}

s.close();
conn.close();
 %>

</table></div>


    
  </body>
</html>
