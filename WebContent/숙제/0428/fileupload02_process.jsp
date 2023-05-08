<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%


	

	String fileUploadPath = "C:\\upload";

	DiskFileUpload upload = new DiskFileUpload();
	
	List items = upload.parseRequest(request);
	
	Iterator params = items.iterator();
	
	while(params.hasNext()) {
		FileItem item = (FileItem) params.next();
		
		if(!item.isFormField())  {
			String fileName = item.getName();
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			File file = new File(fileUploadPath + "/" + fileName);
			
			//file객체를 이용하여 파일 복사 
			item.write(file);
					
		}
		out.println("요청 파라미터 이름 : " + item.getFieldName() +"<br>"); 
		out.println("저장 파일 이름 : " + item.getName()+"<br>");
		out.println("파일 콘텐츠 타입 : " + item.getContentType()+"<br>");
		out.println("파일 크기 : " + item.getSize()+"<br>");
		
	}
%>
</body>
</html>