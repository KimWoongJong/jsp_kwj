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
		<title>employees</title>
		<style>
			*{margin:0; padding:0;}
			div{width:1400px; margin:30px auto;}
			h1{text-align:center; margin-bottom:20px;}
			table,th,td{border:1px solid black; border-collapse: collapse; font-size: 16px;
			text-align: center;}
			th,td{width:200px; height:40px;}
		</style>
	</head>
	<body>
		<div>
			<h1>직원정보</h1>
			<table>
				<tr>
					<th>사원번호</th>
					<th>사원명</th>
					<th>월급</th>
					<th>연봉(salary*12+(salary*12*커미션))</th>
					<th>부서번호</th>
					<th>부서명</th>
					<th>입사일</th>
				</tr>
				<!-- 반복시작 -->
				<%
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					int id,sal; // 사칙연산이 필요한 경우에는 int로 가져올 것
					String ysal,name,did,dname,hdate;
					int i=0;
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
						stmt = conn.createStatement();
						// query문은 한 줄로 oracle에서 가져올 것 
						String query = "select employee_id, emp_name, salary, to_char(salary*12+(salary*12*nvl(commission_pct,0)),'L999,999,999') y_salary,nvl(to_char(b.department_id),'CEO') department_id, nvl(department_name,'CEO') department_name, hire_date from employees a, departments b where a.department_id=b.department_id(+)";
						rs = stmt.executeQuery(query);
						while(rs.next()){
							i++;
							id = rs.getInt("employee_id");
							name = rs.getString("emp_name");
							sal = rs.getInt("salary");
							ysal = rs.getString("y_salary");
							did = rs.getString("department_id");
							dname = rs.getString("department_name");
							hdate = rs.getDate("hire_date")+""; // Date는 String 타입이 아니므로 ""을 더해서 String으로 변환
				%>
						<tr>
							<td><%=id %></td>
							<td><%=name %></td>
							<td><%=sal %></td>
							<td><%=ysal %></td>
							<td><%=did %></td>
							<td><%=dname %></td>
							<td><%=hdate %></td>
						</tr>
				<%}
					}catch(Exception e){
						e.printStackTrace();						
					}finally{
						try{
							if(rs!=null) rs.close();
							if(stmt!=null) stmt.close();
							if(conn!=null) conn.close();
						}catch(Exception e2){e2.printStackTrace();}
					}//
				%>	
				<!-- 반복 끝 -->
			</table>
		</div>
	</body>
</html>