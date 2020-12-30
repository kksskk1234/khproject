<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="professorDAO" class="kr.or.kh.haksa.ProfessorDAO" scope="page"/>
	<jsp:useBean id="professorDTO" class="kr.or.kh.haksa.ProfessorDTO" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table{border: 1px solid pink; border-collapse: collapse;}
th{border: 1px solid blue; background-color: yellow; color : white;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>교수전체출력</h1>
	<% 
	ResultSet rs = professorDAO.professorListSql();
	%>
	
<table border="1" cellspacing = "0" cellpadding = "0">
		<tr>
			<th>번 호</th>
			<th>나이</th>
			<th>이름</th>
			<th>과목</th>
		</tr>
		<tr>

	
	<%
	while(rs.next()) {
		professorDTO.setNo(rs.getInt("no"));
		professorDTO.setNai(rs.getString("age"));
		professorDTO.setIrum(rs.getString("irum"));
		professorDTO.setSubject(rs.getString("subject"));
		out.print("<tr>");
		out.print("<td>"+professorDTO.getNo()+"</td>");
		out.print("<td>"+professorDTO.getNai()+"</td>");
		out.print("<td>"+professorDTO.getIrum()+"</td>");
		out.print("<td>"+professorDTO.getSubject()+"</td>");
		out.print("</tr>");
	}
	%>
	</tr>
	</table>
	<a href="professor.jsp">교수등록</a>
	<a href="../haksainfo.jsp">학사괸리</a>
	<a href = "professorSearchForm.jsp">교수검색</a>
	<a href = "professorDeleteForm.jsp">교수삭제</a>
	<a href = "professorUpdateForm.jsp">교수수정</a>
</body>
</html>