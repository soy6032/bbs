<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--java의 sql 관련 라이브러리를 사용하기 위해서 import  -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<% 
		
		Connection conn = null;
		
		try{
		String url = "jdbc:mysql://localhost:3306/bbs1?serverTimezone=UTC&characterEncoding=UTF-8";
		String userId = "springb";
		String userPw = "asdf1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, userId, userPw);
		/* out.println("연결성공"); */
		}
		catch(SQLException e){
			out.println("실패");
			out.println("SQLException : " + e.getMessage());
		}
		
		%>
	</body>
</html>