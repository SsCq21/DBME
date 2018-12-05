<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.product" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Salesperson-product</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="CSS/menu.css" rel="stylesheet" type="text/css"/>

  </head>
  
  <body style="background: url(IMG/dota.jpg);background-size:cover">
   <div class=right>
   <a href=""><h21>Welcome~<%=session.getAttribute("userid") %></h21></a>
   <a href="salesTrans.jsp"><h21>Back to HOME</h21></a>
     <a href="index.jsp"><h21>Logout</h21></a>
     </div>
     
     <div class="text-center"> 
            <h1 style="text-align:center">ProductManagement</h1>
    </div>
    
    <div align="center" style="margin-top:30px;">
    <form method="POST">
    </font><input type="text" name="Tsearch" value="" size="30" >
    <input class="btn btn-danger" type=submit value="search"><br><br>
    </form></div>
    
    <nav>
  <ul class="main">
    <li><a href="sproduct.jsp">Home</a></li>
    <li><a href="#">Apple</a>
      <ul class="drop menu2">
        <li><a href="#">iPhone</a></li>
        <li><a href="#">iMac</a></li>
        <li><a href="#">iWatch</a></li>
      </ul> 
    </li>
    <li><a href="#">Sumsung</a> 
    <ul class="drop menu3">
        <li><a href="#">Phone</a></li>
        <li><a href="#">Computer</a></li>
      </ul></li>
    <li><a href="#">Dell</a> </li>
    <li><a href="#">Microsoft</a></li>
    <li><a href="#">About</a></li>
  </ul>
</nav>

<%
try {
Class.forName("com.mysql.jdbc.Driver");
}
catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");
Statement s=conn.createStatement();

String sql="select Pid,Pname,image,type,inventory,price,salesperson from product";
ResultSet ck=s.executeQuery(sql);

 %>
 <div align="center">
<table class="table table-bordered margin-top:-50px" width=100% align=center >
<thead><tr class="active">
<td align="center"><h4>Pid</h4></td>
<td align="center"><h4>Pname</h4></td>
<td align="center"><h4>Image</h4></td>
<td align="center"><h4>Type</h4></td>
<td align="center"><h4>Inventory</h4></td>
<td align="center"><h4>Price</h4></td>
<td align="center"><h4>Salesperson</h4></td>
<td align="center"><h4>Edit</h4></td>
</tr></thead>

<% 
int i=0;
ArrayList productlist=new ArrayList();
while(ck.next()) {
String pid=ck.getString("Pid");
session.setAttribute("productid",pid);
String pname=ck.getString("Pname");
String img=ck.getString("image");
String typ=ck.getString("type");
int inven=ck.getInt("inventory");
Double pri=ck.getDouble("price");
String salesperson=ck.getString("salesperson");
product p=new product();
p.setPid(pid);
p.setPname(pname);
p.setimage(img);
p.settype(typ);
p.setinventory(inven);
p.setprice(pri);
p.setsalesperson(salesperson);
productlist.add(i,p);
%>

<tbody><tr>
<td align="center" ><h4><%=pid %></h4></td>
<td align="center"><h4><%=pname %></h4></td>
<td align="center"><img border=0 height=100 src="IMG/product/<%=img %>.jpg"></td>
<td align="center"><h4><%=typ %></h4></td>
<td align="center"><h4><%=inven %></h4></td>
<td align="center"><h4><%=pri %></h4></td>
<td align="center"><h4><%=salesperson %></h4></td>
<td align="center"><a href="editProduct.jsp?index=<%=i%>"><h4 class="btn btn-info">Edit</h4></a></td>
</tr></tbody>
<% i=i+1;}
session.setAttribute("productlist",productlist);

s.close();
conn.close();
 %>

</table></div>
    
    
  </body>
</html>
