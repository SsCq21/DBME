<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.product" import="java.util.Date" import="bean.transactions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>salesTrans</title>
    
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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<link href="CSS/menu.css" rel="stylesheet" type="text/css"/>

  </head>
  
  <body style="background: url(IMG/dota.jpg);background-size:cover">
 <%
 String sid=(String)session.getAttribute("userid");
try {
Class.forName("com.mysql.jdbc.Driver");
}
catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");


String sql2="select Job_title from salespersons where Spid='"+sid+"'";
 Statement s2=conn.createStatement();
 ResultSet ck2=s2.executeQuery(sql2);
 String job=null;
 while(ck2.next()) {
 job=ck2.getString("Job_title");
 session.setAttribute("job", job);}
 
 String sql3="select store from salespersons where Spid='"+sid+"'";
 Statement s3=conn.createStatement();
 ResultSet ck3=s3.executeQuery(sql3);
 String store=null;
 while(ck3.next()) {
 store=ck3.getString("store");
 session.setAttribute("store", store);}
 
 String sql4="select region from stores where Sid='"+store+"'";
 Statement s4=conn.createStatement();
 ResultSet ck4=s4.executeQuery(sql4);
 String region=null;
 while(ck4.next()) {
 region=ck4.getString("region");
 session.setAttribute("region", region);}
 
 
  %>
 
 <div class=right>
     <a href=""><h21>Welcome~<%=session.getAttribute("userid") %></h21></a>
     
     <%if(job.equals("storeManager")||job.equals("regionManager")) {%>
     <a href="sproduct.jsp"><h21>Product</h21></a>
     <a href=""><h21>HR Management</h21></a>
     <%if(job.equals("regionManager")) { %>
     <a href="StoreRegion.jsp"><h21>Store&Region:<%=store+"-"+region %></h21></a>
     <%}} %>
     <a href="index.jsp"><h21>LogOut</h21></a>
     </div>       
         
         <div class="text-center">
            <h1 style="text-align:center"><%=session.getAttribute("userid")%>-TransactionsManagement</h1>
    </div>
    
    <p style="margin:20px"></p> 
    <div class="text-center">
    <form method="POST">
    </font><input type="text" name="Tsearch" value="" size="30" >
    <input class="btn btn-danger" type=submit value="search"><br><br>
    </form></div>
    
    <p style="margin:20px"></p> 
    
    <%
  
Statement s=conn.createStatement();
String sql="select Tid,date,quantity,product,customer from Transactions where salesperson='"+sid+"'";
ResultSet ck=s.executeQuery(sql);

 %> 
 
 <div align="center">
<table class="table table-bordered margin-top:-50px" width=100% align=center >
<thead><tr class="active">
<td align="center"><h4>Tid</h4></td>
<td align="center"><h4>Date</h4></td>
<td align="center"><h4>Quantity</h4></td>
<td align="center"><h4>Customer</h4></td>
<td align="center"><h4>Product</h4></td>
<td align="center"><h4>Edit</h4></td>
<td align="center"><h4>Drop</h4></td>
</tr></thead>

<% 

int i=0;
ArrayList translist=new ArrayList();
while(ck.next()) {
String tid=ck.getString("Tid");
Date date=ck.getDate("date");
int quantity=ck.getInt("quantity");
String cid=ck.getString("customer");
String pid=ck.getString("product");

transactions t=new transactions();
t.setTid(tid);
t.setdate(date);
t.setquantity(quantity);
t.setCid(cid);
t.setPid(pid);
translist.add(i,t);
%>

<tbody><tr>
<td align="center" ><h4><%=tid %></h4></td>
<td align="center"><h4><%=date %></h4></td>
<td align="center"><h4><%=quantity %></h4></td>
<td align="center"><h4><%=pid %></h4></td>
<td align="center"><h4><%=cid %></h4></td>
<td align="center"><h21 class="btn btn-info"><a href="" >Edit</a></h21></td>
<td align="center"><h21 class="btn btn-primary"><a href="dropTrans.jsp">Drop</a></h21></td>
</tr></tbody>
<% i=i+1;}
session.setAttribute("translist",translist);
s.close();
conn.close();
 %>

</table></div>
    
  </body>
</html>
