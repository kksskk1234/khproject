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

#professorSearch {
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
	<h1>교수검색</h1>
	<div id="professorSearch">
		<form action="../professorSearch.do" method="get">
			<ul>
				<li><label for="이름검색">이름검색</label> <input type="text"
					name="irum"></li>
				<li><input type="image" src="../images/search.png" class="kh01">
			</ul>
		</form>
	</div>
	<a href = "professorList.jsp">교수전체출력</a>
</body>
</html>