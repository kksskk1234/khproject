<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.kh01{
width: 60px; height: 40px;
border-radius: 20px;
}
body {
      background-image: url("images/yellow.jpg");
      background-repeat: no-repeat;
      background-size: 2000px;
   background-attachment: fixed;
   width: 1500px; height: 1000px;
   }
.reset{
	font-size: 10px;
}
h1{
	text-align: center; color:olive;
}
#memberForm{
	position: absolute;
	top:300px; left: 600px;
	width:350px;
		border : 1px solid purple;
}
ul{list-style-type: none;}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="memberForm">
<h1>♥환영합니다♥</h1>
	<form action="memberRegister.mb" method="get">
		<ul>
			<li>
			<label for="아이디">아&nbsp;이&nbsp;디&nbsp;</label>
			<input type="text" name="id" size="20" maxlength="10" autofocus="autofocus" required="required" placeholder="아이디를 입력하세요.">
			</li>
			<li>
			<label for="패스워드">패스워드</label>
			<input type="password" name="pw" size="20" maxlength="10" placeholder="패스워드를 입력해주세요.">
			</li>
			<li>
			<label for="주소">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label>
			<input type="text" name="addr" size="20" maxlength="100" placeholder="주소를 입력해주세요.">
			</li>
			<li>
			<label for="핸드폰 ">폰&nbsp;번&nbsp;호&nbsp;</label>
			<input type="text" name="tel" placeholder="010-****-****">
			</li>
			<li>
			<input type="image" src="images/signup.jpg" class="kh01">
			<input type="reset" value="되돌리기" class="reset">
			</li>
		</ul>
	</form>
</div>
</body>
</html>