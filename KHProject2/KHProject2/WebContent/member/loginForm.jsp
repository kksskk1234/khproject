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
.kh01{
width: 60px; height: 40px;
/* border-radius: 20px; */
}
#loginForm{
	position: absolute;
	top:300px; left: 600px;
	width:350px;
	border : 1px solid purple;
}
h1{
	text-align: center; color:olive;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="loginForm">
<h1>♥로그인♥</h1>
<form action="memberLogin.mb" method="get">
<ul>
	<li>
	<label for="아이디">아&nbsp;이&nbsp;디&nbsp;</label>
	<input type="text" name="id" maxlength="10" size="20" autofocus="autofocus" required="required" placeholder="아이디를 입력하세요.">
	</li>
	<li>
	<label for="패스워드">패스워드</label>
	<input type="password" name="pw" maxlength="10" size="20" placeholder="패스워드를 입력하세요.">
	</li>
	<li>
	<input type="image" src="images/login.jpg" class="kh01">
	<a href="index.jsp?page=member/memberForm"><img src="images/signup.jpg" class = "kh01"></a>
	</li>
	<li>
	<a href="member/idcheck.jsp">아이디 찾기</a>&nbsp;&nbsp;<a href="member/pwcheck.jsp">패스워드 찾기</a>
	</li>
</ul>
</form>
</div>
</body>
</html>