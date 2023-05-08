<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = request.getServletContext().getRealPath("/resources/sbadmin/img");
	String encType = "utf-8";
	
	int maxSize = 5 * 1024 * 1024;
	
	File file = new File(realFolder);
	
	if(!file.exists()) {
		file.mkdirs(); //없으면 해당 경로에 들어있는 폴더 전부를 만들어주세요!
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();

	String bookId = "";
	String name = "";
	String unitPrice = "";
	String author = "";
	String publisher = "";
	String releaseDate ="";
	String totalPages = "";
	String description = "";
	String category = "";
	String unitsinStock ="";
	String condition = "";
	String fileName ="";
	String bookImage ="";
	
	
	while(params.hasNext()) {
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()){
			String fieldName = item.getFieldName();
			if(fieldName.equals("bookId")){
				bookId = item.getString(encType);
			}else if(fieldName.equals("name")){
				name = item.getString(encType);
			}else if(fieldName.equals("unitPrice")){
				unitPrice = item.getString(encType);
			}else if(fieldName.equals("author")){
				author = item.getString(encType);
			}else if(fieldName.equals("publisher")){
				publisher = item.getString(encType);
			}else if(fieldName.equals("releaseDate")){
				releaseDate = item.getString(encType);
			}else if(fieldName.equals("totalPages")){
				totalPages = item.getString(encType);
			}else if(fieldName.equals("description")){
				description = item.getString(encType);
			}else if(fieldName.equals("category")){
				category = item.getString(encType);
			}else if(fieldName.equals("unitsinStock")){
				unitsinStock = item.getString(encType);
			}else if(fieldName.equals("condition")){
				condition = item.getString(encType);
			}else if(fieldName.equals("bookImage")){
				bookImage = item.getString(encType);
			}
			
		}else { //폼 페이지에서 전송된 요청 파라미터가 파일이라면 
			String fileFieldName = item.getFieldName(); //요청 파라미터 이름
			fileName = item.getName(); //저장 파일의 이름
			String contentType = item.getContentType(); //파일 콘텐츠 유형
			String originalFileName = fileName;
			long fileSize = item.getSize();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile); //파일 복사
		}			
	}
	// 1. 넘겨받은 폼 데이터 전부를 받아서 변수에 초기화해주세요.
	//  - 초기화 하기 위한 변수는 아래 Book 클래스 newBook변수에 setter를 통해 담긴 변수를 참고해주세요.
/* 	
	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String releaseDate = request.getParameter("releaseDate");
	long totalPages = Long.parseLong(request.getParameter("totalPages"));
	String description = request.getParameter("description");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	String fileName = request.getParameter("bookImage");
	 */
	 Integer price;

		if (unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);

		long stock;

		if (unitsinStock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(unitsinStock);
		
	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(Integer.parseInt(totalPages));
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);

	// 2. 책 1권의 정보가 담긴 자바빈즈 객체를 리스트에 저장해주세요.
	BookRepository bookRepository = BookRepository.getInstance();
	bookRepository.addBook(newBook);

	response.sendRedirect("books.jsp");
%>
