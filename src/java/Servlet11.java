


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Servlet11 extends HttpServlet {

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        try{
            
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        String path="G:\\ooad project\\software.accdb";
        String urll="jdbc:ucanaccess://"+path;
        Connection con = DriverManager.getConnection(urll);
           Statement st = con.createStatement();
            String name=request.getParameter("uname");
            String pass=request.getParameter("upass");
            if(name.equals("admin") && pass.equals("admin"))
                response.sendRedirect("adminn.html");
            
            PreparedStatement p = con.prepareStatement("select ename,epass from emp where ename=? and epass=?");
            p.setString(1,name);
            p.setString(2, pass);
            
            
            ResultSet rs = p.executeQuery();
            while(rs.next())
            {
               response.sendRedirect("dash.html");
            }
        out.close();
        }
        
        
        catch(Exception e){
            System.err.println(e);
        }
    }

    //con = DriverManager.getConnection("jdbc:odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=C:\\Users\\Bruger\\Documents\\Database11.accdb");

}
