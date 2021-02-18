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
		request.setCharacterEncoding("utf-8");
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String comments = request.getParameter("comments");
		
		
		PreparedStatement pstmt;
		try{
			String sql = "update bbs set title = ?, comments=?, cdate=now() where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, comments);
			pstmt.setString(3, num);
			pstmt.executeUpdate();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("lists.jsp");
		%>
	</body>
</html>