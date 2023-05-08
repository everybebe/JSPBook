<%@page import="ch11.test.BoardVO"%>
<%@page import="ch11.test.BoardRepository"%>
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
	1. 게시글 수정을 처리해주세요.
		> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
 <%
 
 	BoardRepository boardRepository = BoardRepository.getInstance();
 
 	int no = Integer.parseInt(request.getParameter("no"));
 	BoardVO vo = boardRepository.getBoardById(no);
 	
 	String title = request.getParameter("title");
 	String content = request.getParameter("content");
 	
 	vo.setTitle(title);
 	vo.setContent(content);
 	
 	response.sendRedirect(request.getContextPath() +"/ch11/test/boardView.jsp?no=" + no);
 	
 %>


</body>
</html>