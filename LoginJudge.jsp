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
    
    <title>My JSP 'LoginJudge.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
    <%
    
    try{ 
     Class.forName("com.mysql.jdbc.Driver");
     }
 catch(ClassNotFoundException  e)  {}

String url="jdbc:mysql://localhost:8889/db";
Connection conn=DriverManager.getConnection(url,"root","root");
Statement s=conn.createStatement();

        //DBbean stmt=new DBbean();
        ResultSet ck;
      
 		String id=request.getParameter("userid");
 		String password=request.getParameter("password");
 		session.setAttribute("userid",id);
 		String sql = "select count(*) from customer where Cid='" + id + "'and Cpwd='" + password + "'";
 	   //ck = stmt.executeQuery(sql);
        ck=s.executeQuery(sql);
        int count=0;
        while(ck.next() ) {count=ck.getInt(1);}
            //ck.next();
            if (count==0) {
            out.println("UserID or Password wrong...Pls reinput...");
                out.println("Turn back in 3 seconds... <br><br> <a href='index.jsp'>If not, press here</a>");
                response.setHeader("refresh", "3;URL=index.jsp");
               
            } else {
             response.sendRedirect("main.jsp");
                
            }
            
            
 	%> 
  </body>
</html>