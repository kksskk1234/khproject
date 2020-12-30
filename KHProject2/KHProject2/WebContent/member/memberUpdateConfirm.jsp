<%@page import="kr.or.kh.member.MemberDTO"%>
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
.kh01{
width: 70px; height: 50px;
/* border-radius: 20px; */
}
ul{
	list-style-type: none;
}
#memberUpdateConfirm{
position: absolute;
top:300px; left: 500px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id = "memberUpdateConfirm">
<%
MemberDTO memberDTO = (MemberDTO)request.getAttribute("memberDTO");
out.print("변경하기전 내용 입니다");
out.print("아이디 : " + memberDTO.getId() + "패스워드 : " + memberDTO.getPw() + "주소 : " + memberDTO.getAddr() + "전화번호 : " + memberDTO.getTel() + "<br>");
%>
<form action="memberUpdateFinal.mb" method="get">
<ul>
	<li>
	<label for = "아이디">아&nbsp;이&nbsp;디&nbsp;</label>
	<input type="text" name="id" size = "25" autofocus="autofocus" required="required" placeholder="수정 할 아이디를 입력해주세요.">
	<input type="hidden" name="idSearch" value="<%=memberDTO.getId() %>">
	</li>
	<li>
	<label for = "패스워드">패스워드</label>
	<input type="password" name="pw" size = "25" placeholder="수정 할 패스워드를 입력해주세요.">
	</li>
	<li>
	<label for="주소">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;</label>
	<input type="text" name="addr" size = "25" placeholder="수정 할 주소를 입력해주세요.">
	</li>
	<li>
	<label for="폰번호">폰&nbsp;번&nbsp;호&nbsp;</label>
	<input type="text" name="tel" size = "25" placeholder="수정 할 폰번호를 입력해주세요.">
	</li>
	<li>
	<input type="image" src="../images/update2.jpg" class="kh01">
	</li>
</ul>
</form>
</div>
</body>
</html>