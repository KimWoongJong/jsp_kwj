<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp-스크립트릿</title>
	</head>
	<body>
	<!-- html주석 : jsp프로그래밍입니다. random함수를 사용했습니다. -->
	<%-- jsp주석 : String.format함수를 사용 5자리 결과값 도출 --%>
	<%
	 //랜덤으로 숫자 : 0 ~ 99999 까지의 숫자를 랜덤
	 //자리수는 5자리가 되어야 함. 00001
	 int num = (int)(Math.random()*100000);
	 String str_num = String.format("%05d", num);
	 out.println(str_num+"<br>");
	 
	 /* 내가 작성한 것 
	 int rnum = (int)(Math.random()*100000);
	 out.println(rnum);
	 String.format("%05d",rnum); */
	 
	 // 5자리의 개별숫자의 합을 출력하시오. 02487 -> 21
	 out.println(str_num.charAt(0)-'0'+"<br>");
	 out.println(str_num.charAt(1)-'0'+"<br>");
	 out.println(str_num.charAt(2)-'0'+"<br>");
	 out.println(str_num.charAt(3)-'0'+"<br>");
	 out.println(str_num.charAt(4)-'0'+"<br>");
	 out.println("합계 : "+((str_num.charAt(0)-'0')+(str_num.charAt(1)-'0')+
			 (str_num.charAt(2)-'0')+(str_num.charAt(3)-'0')+
			 (str_num.charAt(4)-'0'))+"<br>"
			 );
	 
	 // 소문자 a -> A a:97, A:65, 0:48, 1:49, 2:50
	 // 대소문자 변경 +-32
	 // '1' - '0' = 1, 49-48=1, 50-48=2
	
	%>
	
	</body>
</html>