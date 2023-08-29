<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.test2.dao.MemberDAO" %>
<%@ page import="com.test.test2.dto.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		padding: 0;
		margin: 0;
	}
	#section tr th td{
		text-align : center;
	}
</style>
</head>
	<%
		request.setCharacterEncoding("utf-8");
		String custno = request.getParameter("custno");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.findByCustno(custno);
	%>
<body>
	<%@include file="header.jsp"%>
	<%@include file="nav.jsp"%>
	<div id="section">
		<h2>홈쇼핑 회원 등록</h2>
		<form action = "updateMember.jsp" name="updateMemberForm">
			<table>
			<tr>
				<th>회원번호</th>
				<td><input type = "text" name="custno" value="<%=custno%>"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type = "text" name="custname" value="<%=memberDTO.getCustname()%>"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type = "text" name="phone" value="<%=memberDTO.getPhone()%>"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type = "text" name="address" value="<%=memberDTO.getAddress()%>"></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type = "text" name="joindate" value="<%=memberDTO.getJoindate()%>"></td>
			</tr>
			<tr>
				<th>고객등급</th>
				<td><input type = "text" name="grade" value="<%=memberDTO.getGrade()%>"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type = "text" name="city" value="<%=memberDTO.getCity()%>"></td>
			</tr>
			<!-- 
				회원번호<input type = "text" name="custno" value=""><br>
				회원성명<input type = "text" name="custname" value=""><br>
				회원전화<input type = "text" name="phone" value=""><br>
				회원주소<input type = "text" name="address" value=""><br>
				가입일자<input type = "text" name="joindate" value=""><br>
				고객등급[A:VIP,B:일반,C:직원]<input type = "text" name="grade" value=""><br>
				도시코드<input type = "text" name="city" value=""><br>
			-->
			</table>
			<input type="submit" value="수정">
			<input type="button" value="조회" onclick="findMember()">
		</form> 
	
	
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>