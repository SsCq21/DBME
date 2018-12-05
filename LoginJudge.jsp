<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="bean.DBbean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>LoginJudge</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body  style="background: url(IMG/CM.jpg);background-size:cover">
  
    <%
    
    try{ 
     Class.forName("com.mysql.jdbc.Driver");
     }
 catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");


        //DBbean stmt=new DBbean();
      
      
 		String id=request.getParameter("userid");
 		String password=request.getParameter("password");
 		session.setAttribute("userid",id);
 		String sql = "select count(*) from customer where Cid='" + id + "'and Cpwd='" + password + "'";
 		String sql2="select count(*) from Salespersons where Spid='"+id+"'and password='"+password+"'";
 	   //ck = stmt.executeQuery(sql);
 	   Statement s=conn.createStatement();
        ResultSet ck=s.executeQuery(sql);
        Statement s2=conn.createStatement();
        ResultSet ck2=s2.executeQuery(sql2);
        int count1=0,count2=0;
        while(ck.next() ) {count1=ck.getInt(1);}
         while(ck2.next() ) {count2=ck2.getInt(1);}
            //ck.next();
            if (count1!=0) {
            response.sendRedirect("main.jsp");
            } 
            else if(count2!=0){
             response.sendRedirect("salesTrans.jsp");
                
            }
            else {
             out.println("UserID or Password wrong...Pls reinput...");
                out.println("Turn back in 3 seconds... <br><br> <a href='index.jsp'>If not, press here</a>");
                response.setHeader("refresh", "3;URL=index.jsp");
               
            }
            
            
 	%> 
  </body>
</html>
