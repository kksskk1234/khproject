<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
ul{list-style-type: none;}
.kh01{
width: 60px; height: 40px;
/* border-radius: 20px; */
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<form action="../pwcheckConfirm.mb" method="get">
<ul>
<li>
<label for="아이디">아이디</label>
<input type="text" name="id" required="required" autofocus="autofocus" placeholder="아이디를 입력하세요.">
</li>
<li>
<input type="image" src="../images/submit.jpg" class="kh01">
</li>
</ul>
</form>
</body>
</html>