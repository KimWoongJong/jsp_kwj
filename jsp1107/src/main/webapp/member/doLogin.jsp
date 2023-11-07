<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인확인</title>
	</head>
	<body>
		<script>
		</script>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			if(id.equals("admin") && pw.equals("1111")){ //성공할 경우
				session.setAttribute("session_id", id);
				session.setAttribute("session_nicName", "유신스");
				//response.sendRedirect("../layout/main.jsp");
		%>
			<script>
				alert("로그인 하셨습니다!"); 
				location.href="../layout/main.jsp";
			</script>
		<%}else{ //실패할 경우 %>
			<script>
				alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 로그인 해주세요.");
				//history.back(); 이전 페이지로 이동
				location.href="login.jsp";
			</script>
		<%}%>	
	</body>
</html>