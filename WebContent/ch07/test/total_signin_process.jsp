<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.
	
	2. 전달받은 아이디, 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
		- DAO, VO를 활용하여 진행할 수 있도록 합니다.
		- DAO, VO까지는 제가 제공해드릴게요
		
	3. 전달받은 아이디 비밀번호에 해당하는 회원인 경우엔 total_memberList.jsp로 이동하여
		회원 목록 페이지를 완성해주세요.
		- 회원 목록 페이지로 넘어가서 해당 목록 페이지에서 'a001님! 환영합니다!'메세지를 출력해주세요.
		
	4. 전달받은 아이디 비밀번호에 해당하지 않는 회원인 경우엔 total_signin.jsp로 이동하여
		다시 로그인을 진행할 수 있도록 해주시고, 에러 메세지를 출력해주세요!		
	


 -->
 
 <%
 	
 	request.setCharacterEncoding("UTF-8");
 
 	
 	String id = request.getParameter("id");
 	String pw = request.getParameter("pw");
 	
 	MemberDAO dao = MemberDAO.getInstance();
 	ArrayList<MemberVO> memlist = dao.getMemberList();

 	
 	
 	MemberVO vo = new MemberVO();
 	vo.setMem_id(id);
 	vo.setMem_pw(pw);
 	
	Map<String, String> errors = new HashMap<String, String>();
 	
 	if(id==null) {
 		errors.put("id","존재하지 않는 회원입니다!");
 	}
 	
 	if(errors.size() > 0){	// 에러가 존재한다
     	request.setAttribute("errors", errors);
     	request.getRequestDispatcher("total_signin.jsp?err=1").forward(request, response);
    } 	
 	
 	boolean list = false;
    for(MemberVO m : memlist) {
        if(m.getMem_id().equals(id) && m.getMem_pw().equals(pw)) {
            list = true;
            break;
        }
    }
    if(list) {
        // 로그인 성공 시 total_memberList.jsp로 이동
        
        response.sendRedirect("total_memberList.jsp?id=" + id);
    } else {
        // 로그인 실패 시 total_signin.jsp로 이동하면서 에러 메시지 출력
        request.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
        request.getRequestDispatcher("total_signin.jsp").forward(request, response);
    }
%>



 
</body>
</html>