<%@page import="kr.or.kh.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
      background-image: url("images/yellow.jpg");
      background-repeat: no-repeat;
      background-size: 2000px;
   background-attachment: fixed;
   width: 1500px; height: 1000px;
   }
table{
	border:1px solid blue; border-collapse: collapse;
	 text-align: center;
}
td{
	background-color: skyblue;
}
th{
	background-color: yellow;
}
.id{
width:100px;
}
.te{
 width:150px;
}

#memberList{
	position: absolute;
	top:280px; left:280px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="memberList">
<h1>회원목록</h1>
<table border="1" cellspacing="0" cellpadding="0">
	<tr>
		<th class="id">아이디</th>
		<th class="id">패스워드</th>
		<th class="te">주소</th>
		<th class="te">폰번호</th>
	</tr>
<%
ArrayList<MemberDTO> memberList = (ArrayList<MemberDTO>)request.getAttribute("memberList");
for(int i = 0; i < memberList.size(); i++) {
	MemberDTO memberDTO = memberList.get(i);
%>
<tr>
<td><%= memberDTO.getId()%></td>
<td><%= memberDTO.getPw()%></td>
<td><%= memberDTO.getAddr()%></td>
<td><%= memberDTO.getTel()%></td>
</tr>
<% }%>
</table>
<a href="index.jsp?page=member/memberUpdateForm">멤버수정</a>
</div>
</body>
</html>