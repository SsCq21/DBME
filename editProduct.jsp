<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>EditProduct</title>
    
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
<script type="text/javascript">
            function check(){
	var pid = document.getElementById("pid").value;
	var sales = document.getElementById("salesperson").value;
	if(pid==""){
		alert("ProductID cannot be null！");
		return false;
	}
	if(sales==""){
		alert("Salesperson cannot be null！");
		return false;
	}
	
    }
        </script>
  </head>
  
  <body style="background: url(IMG/dota.jpg);background-size:cover">
    <div class=right>
     <a href="sproduct.jsp"><h21>Back to HOME</h21></a>
     </div>
     
   <div class="text-center"> 
            <h1 style="text-align:center">ProductChange</h1>
    </div>
    <p style="margin:40px"></p> 
<%     
   ArrayList productlist=(ArrayList)session.getAttribute("productlist");
  int i=tool.strToint(request.getParameter("index"));
  product p=(product)productlist.get(i);
  String pid=p.getPid();
  String pname=p.getPname();
  double price=p.getprice();
  String img=p.getimage();
  int inventory=p.getinventory();
  String type=p.gettype();
  String salesperson=p.getsalesperson();
  session.setAttribute("productid",pid);
 %>  
 
 <div class="row" >
  <div class="col-md-4 text-center">.</div>
  <div class="col-md-4 text-center" style="background-color:rgba(0,0,0.2,0);">
     <form method="POST" action="pChangeJudge.jsp" onsubmit="return check()">
   <h4>ProductID：<input type="text" name="Pid" id="Pid" value="<%=pid%>" size="20"> </h4>
    <h4>ProductName：<input type="text" name="Pname" id="Pname" value="<%=pname %>" size="20" ></h4>
    <h4>Inventory:<input type="text" name="inventory" id="inventory" value="<%=inventory %>" size="20" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"></h4>
    <h4>Type:<input type="text" name="type" id="type" value="<%=type %>" size="20"></h4>
    <img border=0 height=100 src="IMG/product/<%=img %>.jpg">
    <button>Change</button>
    <h4>Price:<input type="text" name="price" id="price" value="<%=price %>" size="20"></h4>
    <h4>Salesperson:<input type="text" name="salesperson" id="salesperson" value="<%=salesperson %>" size="20"></h4>
   <input type=submit  value="Update" >
    <input type=reset value="Clear"><br><br>
     </form>
    </div>
     <div class="col-md-4 text-center">.</div>
     </div>
  </body>
</html>
