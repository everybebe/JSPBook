<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td class="td">번호</td>
			<td class="td">제목</td>
			<td class="td">작성자</td>
			<td class="td">작성일</td>
			<td class="td">조회수</td>
		</tr>
		<tr>
			<td  class="td">10</td>
			<td  class="td">네이버웍스 일부 기능의 사양 변경 및 종료 안내</td>
			<td  class="td">관리자</td>
			<td  class="td">2022-11-16</td>
			<td  class="td">1455</td>
		</tr>
		<tr>
			<td class="td">9</td>
			<td class="td">[프로모션 공지]네이버웍스 X 워크플레이스 결합 서비스</td>
			<td class="td">관리자</td>
			<td class="td">2022-11-15</td>
			<td class="td">1420</td>
		</tr>
		<tr>
			<td class="td">8</td>
			<td class="td">[프로모션 공지]네이버웍스 X 워크플레이스 결합 서비스</td>
			<td class="td">관리자</td>
			<td class="td">2022-11-15</td>
			<td class="td">12000</td>
		</tr>
		<tr>
			<td class="td">7</td>
			<td class="td">[중요]네이버웍스 V3.5 정기 업데이트 소식</td>
			<td class="td">관리자</td>
			<td class="td">2022-11-14</td>
			<td class="td">1202</td>
		</tr>
		<tr>
			<td class="td">6</td>
			<td class="td">[프로모션 사전 공지]네이버웍스 X 워크플레이스 결합 서비스 20% 추가 할인</td>
			<td class="td">관리자</td>
			<td class="td">2022-11-13</td>
			<td class="td">1111</td>
		</tr>
		<tr>
			<td class="td">5</td>
			<td class="td">드라이브 서비스DB 업그레이드 작업 사전 안내</td>
			<td class="td">관리자</td>
			<td class="td">2022-11-12</td>
			<td class="td">2345</td>
		</tr>
	</table>


	<hr>
	<h3>선택한 td안에 있는 글자를 아래 p태그에 출력해주세요</h3>
	<p id="output"> 출력란!</p>

</body>

<script type="text/javascript">
$('.td').on('click',function(){
	
	text = $(this).val();
	
	$('#output').html(text);
	
	
})


/* $(function(){
	$("td").on("click", function(){
		$("#output").html($(this).text());
	})
}) */
	
	
	

</script>
</html>