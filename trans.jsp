<%@ page language="java" import="java.util.*" import="java.sql.*" import="java.util.Date" pageEncoding="UTF-8"%>
<%@ page import="bean.product" import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Transaction</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background: url(IMG/CM.jpg);background-size:cover">
   <div class="text-right">
     <a href="main.jsp"><h21>HOME</h21></a>
     <a href="index.jsp"><h21>Log Out</h21></a>
     </div>
     
   <div class="text-center"> 
            <h1 style="text-align:center"><%=session.getAttribute("userid")%>-Transaction</h1>
    </div>
    <p style="margin:20px"></p> 
    
   <%
   try{ 
     Class.forName("com.mysql.jdbc.Driver");
     }
 catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");
Statement s=conn.createStatement(); 
   
   java.util.Date date=new java.util.Date();
  String date2=date.toString();  
   String date3=new SimpleDateFormat("yyyy-MM-dd").format(date);
   java.sql.Date date4=new java.sql.Date(date.getDate());
   
  String transdate=new SimpleDateFormat("yyyyMMdd").format(date);
    
    String Tid=null;
    
    for(int i=1;i<999;i++) {
    String n=String.valueOf(i);
    Tid=transdate+n;
    
    String sql="select count(*) from Transactions where Tid='"+Tid+"'";
    ResultSet rs=s.executeQuery(sql);  
    int count=0;
    while(rs.next()) {count=rs.getInt(1);}
    if(count==0) { break; }
    }
   
   ArrayList productlist=(ArrayList)session.getAttribute("productlist");
  product p=(product)productlist.get(0);
  String pid=p.getPid();
  String pname=p.getPname();
  String quantity=request.getParameter("number");
  int quan=Integer.valueOf(quantity).intValue();
  double price=p.getprice();
  double total=quan*price;
  String Cid=(String)session.getAttribute("userid");
  
  String sql2="select salesperson from product where Pid='"+pid+"'";
  ResultSet rs2=s.executeQuery(sql2);
String sales=null;
while(rs2.next()) {
sales=rs2.getString("salesperson");
}

String sql3="insert into Transactions values ('"+Tid+"','"+date3+"','"+quan+"','"+Cid+"','"+pid+"','"+sales+"')";
s.executeUpdate(sql3);

s.close();
//productlist.clear();
    %>
    <div class="row">
  <div class="col-md-4 text-center">.</div>
    <div class="col-md-4 text-center">
    <table class="w3-table-all w3-centered">
      <tr><td>TransactionID:</td>
    <td><%=Tid %></td></tr>
    <tr><td>Date:</td>
    <td><%=date3 %></td></tr>
    <tr><td>Pid:</td>
    <td><%=pid %></td></tr>
    <tr><td>Pname:</td>
    <td><%=pname %></td></tr>
    <tr><td>Price:</td>
    <td><%=price %></td></tr>
    <tr><td>YourID:</td>
    <td><%=Cid %></td></tr>
    <tr><td>SalespersonID:</td>
    <td><%=sales %></td></tr>
    <tr><td>Quantity:</td>
    <td><%=quantity %></td></tr>
     <tr><td>TotalPrice:</td>
     <td><%=total %></td></tr>    
    </table>
    </div>
     <div class="col-md-4 text-center">.</div>
     </div>
     
     <p style="margin:20px"></p> 
     
     <div class="text-center">
     <a href="main.jsp" class="btn btn-success">Back to HOME</a>
     </div>
  </body>
</html>
