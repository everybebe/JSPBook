<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>대덕인재개발원 JSP</title>
<link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<style>
input {
	
}
</style>
<body>
	<div id="wrapper">
		<%@ include file="/include/header.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="/include/nav.jsp"%>
				<div class="container-fluid">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<!-- Basic Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary"></h6>
								</div>
								<!-- 
      1.아이디, 비밀번호, 로그인 버튼을 이용하여 total_signin_process.jsp로 이동하여
      로그인 처리를 진행해주세요.
      
      2.로그인 시, 등록된 회원이 존재하지 않는 경우 '존재하지 않는 회원입니다!' 메세지가 출력되게 해주세요
      
      3. 회원가입 버튼을 생성하고, 회원 가입 버튼을 클릭 시 회원가입 페이지로 이동합니다.
    -->
    						  <%
									String errInfo = request.getParameter("err");
                                	if(errInfo != null){
                                		Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
                              	%>
                                			<c:set value="<%=errInfo %>" var="errors"/>
                                			<c:set value="<%=errors %>" var="errMap"/>
    
						
							<%
                                		String p_id = request.getParameter("id");
                                        String p_pw = request.getParameter("pw");
                                        String p_name = request.getParameter("name");
                                        String p_gender = request.getParameter("gender");
                                        %>
                                        	<c:set value="<%=p_id %>" var="id"/>
                                        	<c:set value="<%=p_pw %>" var="pw"/>
                                        	<c:set value="<%=p_name %>" var="name"/>
                                        	<c:set value="<%=p_gender %>" var="gender"/>
                                        <%
                                	}
                                %>
                                <div class="card-body">
								<form action="total_signin_process.jsp" method="post">
									아이디 : <input type="text" name="id"> <br> 
									<font style="font-size:10px" color="red">${errMap.id }</font>
									비밀번호 : <input type="password" name="pw"> <br> 
									<input type="submit" value="로그인"> <br> <br> 
									<a href="total_signup.jsp">회원가입</a>
								</form>
								<c:if test="${errors eq '1' }">
									<h3>존재하지 않는 회원입니다!</h3>
								</c:if>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>