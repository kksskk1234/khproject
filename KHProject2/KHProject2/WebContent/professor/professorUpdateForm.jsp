<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.kh01 {
	width: 60px;
	height: 10;
}

#professorUpdate {
	border: 1px solid pink;
	border-radius: 20px;
	width: 300px;
}

ul {
	list-style-type: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>교수수정</h1>
	<div id="professorUpdate">
		<form action="../professorUpdate.do" method="get">
			<ul>
				<li><label for="수정 할 이름">수정 할 이름</label> <input type="text"
					name="irum"></li>
				<li><input type="image" src="images/update.jpg" class="kh01">
				</li>
			</ul>
		</form>
	</div>

</body>
</html>