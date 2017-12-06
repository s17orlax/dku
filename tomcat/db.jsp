<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>    
<%
String URL = "jdbc:mysql://my-mysql:3306/snorlax";         //3306은 Mysql포트번호, DB명: snorlax
String USER = "snorlax";
String PASS="0526";

Connection conn=null;
Statement stmt = null;
ResultSet rs = null;

try
{
        Class.forName("com.mysql.jdbc.Driver");                 //mysql을 사용
        conn = DriverManager.getConnection(URL, USER, PASS);    //아이디, 비밀번호, 주소를 넣고 연결 
        stmt = conn.createStatement();
        rs = stmt.executeQuery( "select * from PersonalInfo" );         //DB내 테이블명
        while( rs.next() )
        {
                String id = rs.getString("id");                 //테이블의 필드명 - id, name, email
                String name = rs.getString("name");
                String email = rs.getString("email");
                out.println(" ID: "+id+"<br> Name: "+name+"<br> E-mail: "+email+"<br>");
        }
}catch(SQLException e)                                  //try문 종료
{
        out.println(e.getMessage());
}
finally
{
        if(rs != null)try{rs.close();}catch(SQLException ex){}
        if(stmt != null)try{stmt.close();}catch(SQLException ex){}
        if(conn != null)try{conn.close();}catch(SQLException ex){}
}
%>
