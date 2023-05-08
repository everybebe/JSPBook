<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
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
     1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서
               일반데이터와 파일명을 저장하여 회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트를 저장하여
               목록 페이지에서 리스트 데이터를 활용할 수 있도록 해주세요.
       - DAO, VO 활용
                              
     2. 회원가입이 완료되면, total_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
                              
-->

<%

	request.setCharacterEncoding("utf-8");

	//내가 사용중인 프로젝트의 contextPath  경로(JSPBook/resources/images 경로)
	//이클립스상에서의 폴더 경로가 아닌 이클립에서 만들어낸 프로젝트가 배포 돼서 생성되는 배포 경로가 되겠다.!!
	String path = request.getServletContext().getRealPath("/resources/sbadmin/img");

	File file = new File(path);
	
	if (!file.exists()) {
		file.mkdirs(); //경로가 없으면 다 만들어줌
	
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(5 * 1024 * 1024);//업로드할 파일의 최대 크기(byte)
	upload.setSizeThreshold(4096); //메모리상에 저장할 최대크기(byte)
	upload.setRepositoryPath(path); //업로드될 파일을 임시로 저장할 경로
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Map<String, Object> dataMap = new HashMap<String, Object>();
	// 4MB
	int maxSize = 4 * 1024 * 1024; //파일 업로드 시 1개의 파일 당 사이즈 (최대 사이즈)
	
	
	while (params.hasNext()) {
		FileItem fileItem = (FileItem) params.next();
	
		if (fileItem.isFormField()) { //홈 페이지에서 전송된 요청 파라미터가 일반 데이터일 때
			String name = fileItem.getFieldName(); //파라미터의 이름
			String value = fileItem.getString("UTF-8");
			dataMap.put(name, value);
		}else {
			String fileFieldName = fileItem.getFieldName(); //파라미터 이름
			String fileName = fileItem.getName(); //저장파일의 이름
			
			if (!fileItem.equals("")) {
			String contentType = fileItem.getContentType();
	
			long fileSize = fileItem.getSize();
			File file1 = new File(path + "/" + fileName);
			fileItem.write(file1);
			
			dataMap.put(fileFieldName, fileName);
			}		
		}
	}
	
	MemberDAO dao = MemberDAO.getInstance();  
	
	MemberVO vo = new MemberVO();
	vo.setMem_id(dataMap.get("mem_id").toString());
	vo.setMem_pw(dataMap.get("mem_pw").toString());
	vo.setMem_name(dataMap.get("mem_name").toString());
	vo.setMem_sex(dataMap.get("mem_sex").toString());
	vo.setFilename(dataMap.get("filename").toString());

	
	dao.insertMember(vo);
	
	response.sendRedirect("total_signin.jsp");

%>
</body>
</html>