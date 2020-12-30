<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{}
#boardWrite{position: absolute;
top:300px;left:500px;

}
ul{list-style-type: none;}
.content1{
   position: absolute;
   top:50px; left:50px;
}
.content2{
   position: relative;
   top:0px; left:50px;
}
.reset{
position:absolute;
top:410px;
    width:50px; height:25px;
    background-color: orange;
    border-radius: 20px;
}
#boardTitle{
  position: absolute;
  top:200px;left:600px;
  text-shadow: 5px 5px 5px skyblue;
}
.im{
   width:50px; height: 50px;
}
</style>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="boardTitle">
<h1>게시판 글작성</h1>
</div>
<div id="boardWrite">
<form action="boardRegister.bo" method="get">
<input type="hidden" name="readcount" value="0">
  <ul>
      <li><li><label for="제목"> &nbsp;&nbsp;&nbsp;제목&nbsp;&nbsp;</label>
          <input type="text" name="title" autofocus="autofocus" required="required" placeholder="제목을 입력하세요" size="50" maxlength="100">
      </li>
      <li><label for="내용" class="content1">내용</label>
          <textarea rows="20" cols="80" name="content" placeholder="내용을 입력해주세요" class="content2"></textarea>
      </li>
      <li><label for="작성자">작성자</label>
          <input type="text" name="author" placeholder="작성자입력">
      </li>
      <li><label for="날짜">날 &nbsp;&nbsp;짜</label>
          <input type="date" name="nal">
      </li>
      <li><input type="image" src="images/complete.jpg" class="im">&nbsp;&nbsp;&nbsp;<input type="reset" value="취소" class="reset">
       </li>
       <li>
      <a href="index.jsp?page=board/boardList">게시판 목록</a>&nbsp;
       </li>
  </ul>
</form>
</div>
</body>
</html>