
<%@page import="java.util.ArrayList"%>
<%@page import="ch11.test.BoardRepository"%>
<%@page import="ch11.test.BoardVO"%>
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
	1. 게시판 수정 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 제목입니다1
	작성자 : 홍길동
	내용 : 내용입니다1
	─────────────────────────────
	[ 수정  ] [ 목록 ]
	
	2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
 -->
 
  <%
 	BoardRepository boardRepository = BoardRepository.getInstance();
 
 	int no = Integer.parseInt(request.getParameter("no"));

 	BoardVO vo = boardRepository.getBoardById(no);
 	

 	if(vo == null) {
 		response.sendRedirect(request.getContextPath() +"/ch11/test/exceptionBoard_error.jsp");
 		
 	} else {
 	
 	String title = vo.getTitle();
 	String content = vo.getContent();
 	
 %>
	<h1>게시판 수정하기</h1>
	
	<form action="<%=request.getContextPath()%>/ch11/test/boardUpdate.jsp">
		<label>글번호 : </label> <input type="text" name="no" readonly value="<%=vo.getNo() %>"> <br>
		<label>제목 : </label> <input type="text" name="title" value="<%=vo.getTitle() %>"> <br>
		<label>작성자 : </label> <input type="text" name="writer" readonly value="<%=vo.getWriter() %>"> <br>
		<label>내용 : </label><br>
		<textarea rows="10" cols="30" name="content"><%=vo.getContent()%></textarea>
		<br>
		<hr>
		<label>첨부파일</label> <input type="file" name="file"> <br>
		<br>
		<hr>
		<input type="submit" value="수정"> 
		<input type="button" value="목록" onclick="location.href='<%=request.getContextPath()%>/ch11/test/boardList.jsp'"> 
	</form>

 <%
 
 	}
 %>
</body>
</html>