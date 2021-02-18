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
				<form action="updateProc.jsp">
				<table>
					<tr height="40">
						<td>제목</td>
						<td colspan="3"><input type="text" value="<%=title%>" name="title"></td>
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
						<td colspan="3"><textarea rows="5" cols="80" name="comments"><%=comments %></textarea> </td>
					</tr>
				</table>
				<input type="hidden" value="<%=cdate%>" name="cdate">
				<input type="hidden" value="<%=num%>" name="num">
				<a href="lists.jsp">목록</a>&nbsp;&nbsp;
				<button type="submit">수정</button>
				</form>
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