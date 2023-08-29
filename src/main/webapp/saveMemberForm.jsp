<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.test.test2.dao.MemberDAO" %>
<%@ page import = "com.test.test2.dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	padding: 0;
	margin: 0;
}
#section {
	background-color: lightgray;
	text-align : center;
}
h2 {text-align : center;
}
</style>
<title>Insert title here</title>
</head>
		<%
		MemberDAO memberDAO = new MemberDAO();
			int custno = memberDAO.getCutNo();
		%>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<div id="section">
		<h2>홈쇼핑 회원 등록</h2>
		<form action = "saveMember.jsp" name="saveMemberForm">
			회원번호(자동발생)<input type = "text" name="custno" value="<%=custno%>"><br>
			회원성명<input type = "text" name="custname" value=""><br>
			회원전화<input type = "text" name="phone" value=""><br>
			회원주소<input type = "text" name="address" value=""><br>
			가입일자<input type = "text" name="joindate" value=""><br>
			고객등급[A:VIP,B:일반,C:직원]<input type = "text" name="grade" value=""><br>
			도시코드<input type = "text" name="city" value=""><br>
			<input type="submit" value="등록">
			<input type="button" value="조회" onclick="findMember()">
		
		</form> 
	
	
	</div>

	<%@include file="footer.jsp"%>

</body>
<script>
	const findAll =()=>{
		location.href = "findMember.jsp";
	}
</script>
</html>