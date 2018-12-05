<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" import="bean.region"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>StoreRegion</title>
    
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
  
  <body style="background: url(IMG/CM.jpg);background-size:cover">
    <div class=right>
   <a href="salesTrans.jsp"><h21>Home-Trans</h21></a>
   </div>
    <div class="text-center"> 
            <h1 style="text-align:center"><%=session.getAttribute("userid")%>-StoreManagement</h1>
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
String Spid=(String)session.getAttribute("userid");
String Sid=(String)session.getAttribute("store");
String region=(String)session.getAttribute("region");

String sql1="select address from stores where Sid='"+Sid+"'";
ResultSet rs1=s.executeQuery(sql1);
String address=null;
while(rs1.next()) {
address=rs1.getString("address");
}

String sql2="select name from stores where Sid='"+Sid+"'";
ResultSet rs2=s.executeQuery(sql2);
String name=null;
while(rs2.next()) {
name=rs2.getString("name");
}

String sql3="select salesperson_number from stores where Sid='"+Sid+"'";
ResultSet rs3=s.executeQuery(sql3);
int number=0;
while(rs3.next()) {
number=rs3.getInt("number");
}

%>
<div class="row" >
<div class="col-md-6 text-center">
 <form method="POST" action="">
 <h3>StoreID：<%=Sid%></h3>
 <h3>Address：<input type="text" name="address" id="address" value="<%=address %>" size="20" ></h3>
 <h3>Name：<input type="text" name="name" id="name" value="<%=name %>" size="20" ></h3>
 <h3>SalespersonNumber：<input type="text" name="number" id="number" value="<%=number %>" size="20" ></h3>
 <h3>Region：<input type="text" name="region" id="region" value="<%=region %>" size="20" ></h3>
  <input type=submit  value="Update" >
    <input type=reset value="Clear"><br><br>
 </form>
</div>

<div class="col-md-6 text-center">
<div align="center">
<table class="table table-bordered margin-top:-50px" width=100% align=center >
<thead><tr class="active">
<td align="center"><h4>RegionID</h4></td>
<td align="center"><h4>Name</h4></td>
</tr></thead>
<%
Statement s2=conn.createStatement();
String sql4="select Rid,name from Regions";
ResultSet rs4=s2.executeQuery(sql4);
int i=0;
ArrayList regionlist=new ArrayList();
while(rs4.next()) {
String Rid=rs4.getString("Rid");
String name2=rs4.getString("name");
/*
region r=new region();
r.setRid(Rid);
r.setname(name2);
*/
 %>
 <tbody><tr>
<td align="center" ><h4><%=Rid%></h4></td>
<td align="center"><h4><%=name2 %></h4></td>
</tr></tbody>
 <% i=i+1;}
 conn.close();
 
 %>
</table></div>

 
 


</div>
  </body>
</html>
