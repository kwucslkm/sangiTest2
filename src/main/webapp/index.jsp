<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2</title>
<style>
* {
	padding: 0;
	margin: 0;
}

#contents {
	background-color: lightgray;
	padding: 20px;
}

h2 {
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<div id="contents">
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<br>
		<pre>
				쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
				프로그램 작성 순서
				1. 회원정보 테이블을 생성한다.
				2. 매출정보 테이블을 생성한다.
				3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 우가 생성한다.
				4. 회원정보 입력 화면프로그램을 작성한다.
				5. 회원정보 조회 프로그램을 작성한다.
				6. 회원매출정보 조회 프로그래을 작성한다.
			</pre>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>