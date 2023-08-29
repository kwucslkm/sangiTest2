<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.test.test2.dao.MemberDAO" %>
<%@ page import = "com.test.test2.dto.MemberDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	    String custno = request.getParameter("custno");
	    String custname = request.getParameter("custname");
	    String phone = request.getParameter("phone");
	    String address = request.getParameter("address");
	    String joindate = request.getParameter("joindate");
	    String grade = request.getParameter("grade");
	    String city = request.getParameter("city");
		System.out.println("city="+city);
	    MemberDAO memberDAO = new MemberDAO();
	    int result = memberDAO.updateMember(custno, custname, phone, address, joindate, grade, city);
	    System.out.println("update Result="+result);
		if ( result >0){
	%>
	<script>
		alert("회원정보수정이 완료 되었습니다.");
		location.href = "findMember.jsp";
	</script>
	
	<%
		}else {
	%>
	<script>
		alert("수정 실패");
		location.href = "saveMemberForm.jsp";
	</script>		
	<%}
	%>
</body>
</html>