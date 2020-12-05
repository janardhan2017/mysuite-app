<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
// read data
String str1=request.getParameter("uname");
String str2=request.getParameter("pwd");
int i=check(str1,str2);
if(i==1)
	
	out.print("login success");

else

out.print("login failed");

%>
<%!
int count;
int check(String str1, String str2)
{
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		java.sql.Connection con=java.sql.DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","janardhan","virtusa");
		java.sql.PreparedStatement psmt=con.prepareStatement("select count(*) from login where uname=? and pwd=?");
		psmt.setString(1,str1);
		psmt.setString(2, str2);
		java.sql.ResultSet rs=psmt.getResultSet();
		rs.next();
		count=rs.getInt(1);
		rs.close();
		psmt.close();
		con.close();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return count;
}
%>
<br/>
<a href="index.html">please click here</a>
	</body>
</html>