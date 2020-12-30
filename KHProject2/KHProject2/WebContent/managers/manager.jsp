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

#managerRegister {
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
	<div id="managerRegister">
		<h1>관리자등록</h1>
		<form action="../managerRegister.do" method="get">
			<ul>
				<li><label for="나이">나이</label> <input type="number" name="nai">
				</li>
				<li><label for="이름">이름</label> <input type="text" name="irum"
					size="20"></li>
				<li><label for="부서">부서</label> <input type="text" name="part"
					size="20"></li>
				<li><input type="image" src="images/submit.png" class="kh01">
				</li>
			</ul>
		</form>
	</div>
	<a href = "managerList.jsp">관리자전체출력</a>
	<a href = "../haksainfo.jsp">학사관리</a>
	<a href = "managerDelete.jsp">관리자삭제</a>
</body>
</html>