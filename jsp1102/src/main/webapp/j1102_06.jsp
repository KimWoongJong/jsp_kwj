<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<%-- 주석 --%>
		<%! //서블릿에서 계산이 되어진 결과값 리턴해 가지고 옴
			//선언식에 사용 - 전역변수 선언, 메소드 선언
			int a=0;
			int b=0;
			public int sum(int a, int b){
				return a+b;
		}
		%>
		<%
			int a = 10;
			int b = 2;
			out.println(a+b+"<br>");
		%>
		<% out.println(sum(10,2)+"<br>"); %>
		<% out.println(sum(10,20)+"<br>"); %>
	
	</body>
</html>