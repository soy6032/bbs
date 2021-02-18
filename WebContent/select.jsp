<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style type="text/css">
			table{
				width:100%;
				border: 1px solid black;
				border-collapse: collapse; 
			}
			td, th{
				border: 1px solid black;
				text-align: center;
			}
			.container{
				width: 960px;
				margin: 0 auto;
			}
			a{
				text-decoration: none;
				color:black;
			}
			
		</style>
	<body>
		<%@ include file="dbConn.jsp"%>
		<%
		String number = request.getParameter("num");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String readsql = "update bbs set views=views+1 where num=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setString(1, number);
			pstmt.executeUpdate();
			
			String sql = "select * from bbs where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String num = rs.getString(1);
				String title = rs.getString(2);
				String comments = rs.getString(3);
				String writer = rs.getString(4);
				String cdate = rs.getString(5);
				String views = rs.getString(6);
				String likes = rs.getString(7);
			%>
			<%-- <p>제목 : <%=title %></p>
			<p>작성자 : <%=writer %></p>
			<p>글내용 : <%=comments %></p>
			<p>글내용 : <%=cdate %></p>
			<p>글내용 : <%=views %></p>
			<p>글내용 : <%=likes %></p> --%>
			<div class="container">
				<table>
					<tr height="40">
						<td>제목</td>
						<td colspan="3"><%=title %></td>
					</tr>
					<tr height="40">
						<td >추천</td>
						<td><%=likes %></td>
						<td>조회수</td>
						<td><%=views %></td>
					</tr>
					<tr height="40">
						<td>작성자</td>
						<td><%=writer %></td>
						<td>작성일</td>
						<td><%=cdate %></td>
					</tr>
					<tr height="220">
						<td>글내용</td>
						<td colspan="3"><%=comments %></td>
					</tr>
				</table>
				<a href="lists.jsp">목록</a>&nbsp;&nbsp;
				<a href="delete.jsp?num=<%=num%>">삭제</a>&nbsp;&nbsp;
				<a href="updateForm.jsp?num=<%=num%>">수정</a>&nbsp;&nbsp;
			</div>
			<%	
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			if(conn != null){
				conn.close();
			}
			if(rs != null){
				rs.close();
			}
		}
		%>
		
	</body>
</html>