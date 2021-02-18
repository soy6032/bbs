<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 전체 목록</title>
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
		</head>
			<body>
				<%@ include file="dbConn.jsp"%>
				<div class="container">
					<table>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회</th>
								<th>추천</th>
							</tr>
						</thead>
						<tbody>
							<%
							Statement stmt = null;
							ResultSet rs = null;
			
							try {
								String sql = "select * from bbs order by num desc";
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
			
								while (rs.next()) {
									String num = rs.getString("num");
									String title = rs.getString("title");
									String writer = rs.getString("writer");
									String cdate = rs.getString("cdate");
									String views = rs.getString("views");
									String likes = rs.getString("likes");
							%>
							<tr>
								<td><%=num%></td>
								<td><a href="select.jsp?num=<%=num%>"><%=title%></a></td>
								<td><%=writer%></td>
								<td><%=cdate%></td>
								<td><%=views%></td>
								<td><%=likes%></td>
							</tr>
							<%
								}
							} catch (Exception e) {
							e.printStackTrace();
							} finally {
							if (rs != null) {
							rs.close();
							}
							if (stmt != null) {
							stmt.close();
							}
							if (conn != null) {
							conn.close();
							}
							}
							%>
					</tbody>
				</table>
				<!-- <button id="btn_write" >글쓰기</button> -->
				<a href="write.jsp">글쓰기</a>
			</div>
		</body>
</html>