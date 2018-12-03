<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.product" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="tool" class="bean.MyTools" scope="page"/>
<jsp:useBean id="cart" class="bean.cart" scope="session"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>BUY</title>
    
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

  </head>
  
  <body style="background: url(IMG/CM.jpg);background-size:cover">
   <div class=right>
     <a href="index.jsp"><h21>HOME</h21></a>
     </div>
     
   <div class="text-center"> 
            <h1 style="text-align:center"><%=session.getAttribute("userid")%>-BUY</h1>
    </div>
    <p style="margin:20px"></p> 
    
  <%
  ArrayList productlist=(ArrayList)session.getAttribute("productlist");
  int i=tool.strToint(request.getParameter("index"));
  product p=(product)productlist.get(i);
  String pid=p.getPid();
  String pname=p.getPname();
  double price=p.getprice();
  String img=p.getimage();
  int number=1;
  double total=number*price;
   %>  
  <div class="row">
  <div class="col-md-4 text-center">.</div>
  <div class="col-md-4 text-center" style="background-color:rgba(0,0,0,0.1);"> 
  <table width=100%>
  <tr><td align="center"><h3>Pid:<%=" "+pid %></h3></td></tr>
  <tr><td align="center"><h3>Pname:<%=" "+pname %></h3></td></tr>
  <tr><td align="center"><img border=0 height=170 src="IMG/product/<%=img %>.jpg"></td></tr>
  <tr><td align="center"> <h4>Price:<input type="text" id="p" size="4" value="<%=price %>" readonly="readonly" style="border:none;background-color:transparent"></h4></td></tr>
  <tr><td align="center"><h4>Number:<input type="text" id="number" size="5" value="1" oninput="changen()">
<p id="demo">TotalPrice:<%=" "+total%></p></h4>
</td></tr>
  </table>
 
    </div>
  
 <script>
function changen() {
var n=document.getElementById("number").value;
var p=document.getElementById("p").value;
var total=n*p;
document.getElementById("demo").innerHTML="TotalPrice: "+total;
}

</script> 
  <div class="col-md-4 text-center">.</div> 
   </div> 
   
   <p style="margin:20px"></p> 
    <div class="text-center">
  <a href="#" class="btn btn-success">Confirm</a>
  </div>
  </body>
</html>
