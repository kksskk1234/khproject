<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="studentDAO" class="kr.or.kh.haksa.StudentDAO" scope="page"/>
	<jsp:useBean id="studentDTO" class="kr.or.kh.haksa.StudentDTO" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<h1>학생전체출력</h1>
<%
	ResultSet rs = studentDAO.studentListSql();
%>
<table border="1" cellspacing="0" cellpadding="0">
    <tr>
        <th>번호</th>
        <th>나이</th>
        <th>이름</th>
        <th>학번</th>
    </tr>
    <tr>
    <%
    while(rs.next()) {
		studentDTO.setNo(rs.getInt("no"));
		studentDTO.setNai(rs.getString("age"));
		studentDTO.setIrum(rs.getString("irum"));
		studentDTO.setHakbun(rs.getString("hakbun"));
		out.print("<tr>");
		out.print("<td>"+studentDTO.getNo()+"</td>");
		out.print("<td>"+studentDTO.getNai()+"</td>");
		out.print("<td>"+studentDTO.getIrum()+"</td>");
		out.print("<td>"+studentDTO.getHakbun()+"</td>");
		out.print("</tr>");
	}
     %>
    </tr>
    </table>
    <a href = "student.jsp">학생등록</a>
    <a href = "studentSearchForm.jsp">학생검색</a>
    <a href = "studentDeleteForm.jsp">학생삭제</a>
    <a href = "studentUpdateForm.jsp">학생수정</a>
</body>
</html>