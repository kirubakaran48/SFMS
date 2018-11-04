<%-- 
    Document   : jsp3
    Created on : Oct 3, 2018, 10:38:24 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <script type="text/javaScript">
        function vall()
        {
            alert("Modified successfully");
            return true;
        }
        </script>
            
 
    </head>
    
    <body>
        <form action="Servlet3" onsubmit="vall()">
            Enter studentid to be modified: <input type="text" name="idemp">
            <p>Enter New Details</p>
            Name:<input type="text" name="sname"><br><br>
            Student Id:<input type="text" name="sid"><br><br> 
  	     DOB:<input type="text" name="spname"><br><br>
             Phone Number:<input type="text" name="sphno"><br><br>
             Address:<input type="text" name="spid"><br><br>
             CGPA:<input type="text" name="ssal"><br><br>
             
             <input type="submit" value="update">
             
             
    </body>
</html>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
    try{
            
        response.setContentType("text/html");
        
       
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        String path="c:\\pro\\database.accdb";
        String urll="jdbc:ucanaccess://"+path;
        Connection con = DriverManager.getConnection(urll);
           Statement st = con.createStatement();
            
            
            ResultSet rs; 
            String sqlquery= "select * from student ";
           rs= st.executeQuery(sqlquery);
out.println("<html>" +"<head>" +"<title></title>" +"</head>" +"<body>");
out.println("<form>");
out.println("<div style='padding-left:650px;' id='disp'>");
out.println("<table border='1' cellspacing='0'");
out.println("<td><b>Student ID </b></td>");
out.println("<tr> <td><b> Name</b></td>");
out.println("<td><b>Gender</b></td>");
out.println("<td><b>DOB</b></td>");
out.println("<td><b>Phone Number</b></td>");
out.println("<td><b>Address</b></td>");
out.println("<td><b>CGPA</b></td>");
out.println("</tr>");
           while(rs.next())
           {

out.println("<tr>");
out.println("<td>"+rs.getString(4)+"</td>");
out.println("<td>"+rs.getString(5)+"</td>");
out.println("<td>"+rs.getString(2)+"</td>");
out.println("<td>"+rs.getString(3)+"</td>");
out.println("<td>"+rs.getString(6)+"</td>");
out.println("<td>"+rs.getString(7)+"</td>");
out.println("<td>"+rs.getString(8)+"</td>");
out.println("</tr>");
out.println("</div>");
out.println("</body>");
out.println("</form>");
 out.println("</html>");
           }
  
         String name=request.getParameter("sname");
         String id=request.getParameter("sid");
         String phno=request.getParameter("sphno");
         String pid=request.getParameter("spid");
         String pname=request.getParameter("spname");   
         String sal=request.getParameter("ssal");
         
         
        sqlquery="delete from emp where eid='"+id+"'";
        rs=st.executeQuery(sqlquery);
        sqlquery="insert into emp(ename,eid,dob,ephno,addr,cgpa) values('"+name+"','"+id+"','"+phno+"','"+pid+"','"+pname+"','"+sal+"')";
        rs=st.executeQuery(sqlquery);
        RequestDispatcher rd = request.getRequestDispatcher("index.html");
        rd.forward(request,response);
        
            
        
        out.close();
        }
        
        
        catch(Exception e){
            System.out.println(e);
        }
%>
<!DOCTYPE html>
