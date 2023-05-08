<%@page import="ch11.test.BoardVO"%>
<%@page import="java.util.ArrayList"%>
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
	1. 게시글 등록을 처리해주세요.
		> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 게시글 등록 실패 시, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
<h3>게시글 등록 성공 !</h3>


<%
	
	BoardRepository boardRepository = BoardRepository.getInstance();
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String date = boardRepository.getCurrenTime();
	
	BoardVO vo = new BoardVO();

	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	vo.setRegDate(date);
	
	boardRepository.addBoard(vo);

	int no = vo.getNo();
	response.sendRedirect(request.getContextPath() +"/ch11/test/boardView.jsp?no=" + no);
%>


</body>
</html>