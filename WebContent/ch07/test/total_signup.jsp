<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>대덕인재개발원 JSP</title>
    <link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<style>
input{
	
}

</style>
<body>
  <div id="wrapper">
  
		<%@ include file="/include/header.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@ include file="/include/nav.jsp" %>
                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    	
                                    </h6>
                                </div>

<!--
	1. 아이디, 비밀번호, 이름, 성별, 프로필 이미지를 입력받고
	회원가입을 진행해주세요.

	2. 회원가입 진행 경로는 total_signup_process.jsp로 이동하여 회원가입 처리를 완료해주세요.
	
	3. 뒤로가기 버튼을 생성하고, 뒤로가기 버튼을 클릭 시 다시 로그인 화면으로 나갈 수 있도록 해주세요.
	
	
	
  -->
<form action="total_signup_process.jsp" method="post" enctype="multipart/form-data">
  아이디 : <input type="text" name="id"><br>
 비밀번호 : <input type="password" name="pw"><br>
 이름 : <input type="text" name="name"><br>
 성별 : <input type="radio" name="gender" value="남"> 남자
      <input type="radio" name="gender" value="여"> 여자<br>
프로필 이미지 : <input type="file" name="filename">   <br><br>


<input type="submit" value="가입하기">
<input type="button" value="뒤로가기" onclick="location.href='total_signin.jsp'">

</form> 

</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>