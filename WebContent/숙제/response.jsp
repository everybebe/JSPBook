<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

현재 시간은 <% response.setIntHeader("Refresh", 5); %>


<% Calendar cal= Calendar.getInstance();
			SimpleDateFormat simple = new SimpleDateFormat("HH:mm:ss a");
			String a = simple.format(cal.getTime());
			%>
			
<%=a%> <br>
<a href="response_data.jsp">구글 홈페이지 바로가기</a>"



</body>
</html>