<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>id,pw 체크</title>
	</head>
	<body>
		<%
			String uid = request.getParameter("id");
			String upw = request.getParameter("pw");
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String id,pw;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
			stmt = conn.createStatement();
			String query = "select * from member where id='"+uid+"' and pw='"+upw+"'";
			//String query = "select count(*) lcheck from member where id='"+uid+"' and pw='"+upw+"'";
			rs = stmt.executeQuery(query);
			// id,pw 틀리면 -> 0이라는 값 리턴
			if(rs.next()){// 값의 리턴 여부만 확인함(그래서 아이디/패스워드가 틀려도 로그인됨) <- 카운트를 사용할 경우 if문을 한 번 더 사용해야함
				session.setAttribute("session_id", uid);
				session.setAttribute("session_nicName", uid+"스");
				
				//int lcheck = rs.getInt("lcheck");
				//if(lcheck>0){}
		%>		
			<script>
				<%-- alert("<%=lcheck %>개 로그인 되었습니다!!"); --%>
				alert("로그인 되었습니다!!");
				location.href="jsp_main.jsp";
			</script>	
		  <%}else{%>
			<script>
				alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 로그인 해주세요.");
				location.href="jsp_login.jsp";
			</script>	
		  <%}%>
		  
		  
	</body>
</html>