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
		<title>Insert title here</title>
	</head>
	<body>
	<%
		// oracle db 데이터 활용을 위한 코드
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		// 변수 선언
		int bno=0;
		String btitle="",bcontent="",bdate="",id="",bfile="";
		int bgroup=0;
		int bstep=0;
		int bindent=0;
		int bhit=0;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
			stmt = conn.createStatement();
			String query = "select * from board";
			rs = stmt.executeQuery(query);
			while(rs.next()){
				bno = rs.getInt("bno");
				btitle = rs.getString("btitle");
				bcontent = rs.getString("bcontent");
				bdate = rs.getDate("bdate")+""; //날짜
				// Timestamp e = rs.getTimestamp("bdate"); // Timestamp 객체로 받음
				id = rs.getString("id");
				bgroup = rs.getInt("bgroup");
				bstep = rs.getInt("bstep");
				bindent = rs.getInt("bindent");
				bhit = rs.getInt("bhit");
				bfile = rs.getString("bfile");
				out.println("번호 : "+bno+", 제목 : "+btitle+", 내용 : "+bcontent+", 날짜 : "+bdate+", 아이디"
						+id+", 그룹 : "+bgroup+", 단계 : "+bstep+", 인덴트 : "+bindent+", 조회수 : "+bhit+", 파일 : "+bfile+"<br>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	%>
	</body>
</html>