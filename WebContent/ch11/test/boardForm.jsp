<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시판 등록 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 
	작성자 : 
	내용 :
	─────────────────────────────
	첨부파일 : [파일 선택 ]
	─────────────────────────────
	[ 등록  ] [ 목록  ]
	
	2. 등록 버튼 클릭 시, 게시글 등록(boardInsert.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 게시판 목록 페이지(boardList.jsp)로 이동해주세요

 -->
 
 <h1>게시글 등록</h1>
 <hr>
 
 <form action="<%=request.getContextPath()%>boardInsert.jsp">
 	<label>제목 : </label>
 	<input type="text" name="title"> <br>
 	<label>작성자 : </label>
 	<input type="text" name="writer"> <br>
 	<label>내용 : </label><br>
 	<textarea rows="10" cols="30" name="content"></textarea> <br>
 	<hr>
 	<label>첨부파일</label>
 	<input type="file" name="file"> <br> <br>
 	<hr>
 	<input type="submit" value="등록">
 	<input type="button" value="목록" onclick="location.href='<%=request.getContextPath()%>boardList.jsp'">
 	
 </form>
 
</body>
</html>