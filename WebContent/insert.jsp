<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<%@ include file="dbConn.jsp"%>
<% 
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String comments = request.getParameter("comments");

Statement stmt = null;
PreparedStatement pstmt;

try {
	/* String sql = "insert into bbs (num, title, comments, writer, cdate, views, likes) values(7, '" + title + "','"+ comments + "','" +  title  +"','" ', '달순', '2021.02.18 14:14:00', 23, 4); "; */
	/* stmt = conn.createStatement(); */
	String sql = "insert into bbs values(NULL,?,?,?,sysdate(),0,0)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, comments);
	pstmt.setString(3, writer);
	pstmt.executeUpdate();
	} 
catch (Exception e) {
	e.printStackTrace();
	} 
finally {
	if (stmt != null) {
	stmt.close();
	}
	if (conn != null) {
	conn.close();
		}
	}

response.setHeader("Refresh", "3;URL=lists.jsp");
%>
