<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<%
	String idDelete = (String)session.getAttribute("id");
	//getId 문자열의 값을 갖고올것이냐. getAttribute 이름의 값을 가져올것인가
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb","underdogb", "khacademy1!");
	String sql = "delete from memberSK where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, idDelete);
	int cnt = pstmt.executeUpdate();
	session.invalidate();
%>

 	<%=cnt %>건 회원님이 탈퇴 되었습니다. 
 	<%response.sendRedirect("index.jsp?page=kh"); %>

<a href="index.jsp?page=kh">메인으로</a>
</body>
</html>