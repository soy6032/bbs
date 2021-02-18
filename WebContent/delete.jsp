<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%@ include file="dbConn.jsp"%>
		<%
		
		String number = request.getParameter("num");
		PreparedStatement pstmt = null;
		
		try{
			String sql = "delete from bbs where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			pstmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		response.sendRedirect("lists.jsp");
		%>
	</body>
</html>