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
	1. 게시글 상세보기를 출력해주세요.
		> JSTL을 활용해주세요. 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	[ 수정  ] [ 삭제  ] [ 목록  ]
	
	2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
	3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버 튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
	4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
 -->
 
 <% 
 	BoardRepository boardRepository = BoardRepository.getInstance();
 
 	int no = Integer.parseInt(request.getParameter("no"));
	BoardVO vo = boardRepository.getBoardById(no);
 	
 %>
 
<h1>게시판 상세보기</h1>
<hr>

 
 	<label>제목 : </label>
 	<label><%=vo.getTitle()%></label><br>
 	<label>작성자 : <%=vo.getWriter() %> </label>
 	<label>작성일 : <%=vo.getRegDate()%></label>
 	<label>조회수 : <%=vo.getHit()%></label>
 	<br>
 	<label>내용 : </label>
 	<label><%=vo.getContent() %></label>
 	<hr>
 	<input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/ch11/test/boardUpdateForm.jsp?no=<%=vo.getNo()%>'">
 	<input type="button" value="삭제" onclick="delBtn()">
 	<input type="button" value="목록" onclick="location.href='<%=request.getContextPath()%>/ch11/test/boardList.jsp'">
 	

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 
</body>

<script type="text/javascript">
	function delBtn() {
		if(confirm('정말로 삭제하시겠습니까?')){ //확인
				 location.replace("<%=request.getContextPath()%>/ch11/test/boardRemove.jsp?no=<%=vo.getNo()%>");
			}else { //취소
				return false;
			}
		}
</script>
</html>