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

#professorRegister {
	border: 1px solid pink;
	border-radius: 20px;
	width: 300px;
}

ul {
	list-style-type: none;
}
</style>

<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
	<div id="professorRegister">
		<h1>교수등록</h1>
		<form action="../professorRegister.do" method="get">
			<ul>
				<li><label for="나이">나이</label> <input type="number" name="nai">
				</li>
				<li><label for="이름">이름</label> <input type="text" name="irum"
					size="20"></li>
				<li><label for="과목">과목</label> <input type="text" name="subject"
					size="20"></li>
				<li><input type="image" src="images/submit.png" class="kh01">
				</li>
			</ul>
		</form>
	</div>
	<a href = "professorList.jsp">교수전체출력</a>
	<a href = "../haksainfo.jsp">학사관리</a>
	<a href = "professorDelete.jsp">교수삭제</a>
</body>
</html>