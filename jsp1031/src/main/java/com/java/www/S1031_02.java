package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S02")
public class S1031_02 extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		System.out.println("학번 : "+request.getParameter("no"));
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int total = kor+eng+math;
		float avg = (float) (total/3.0);
		String[] subjects = request.getParameterValues("subject");
		String subject="";
		for(int i=0;i<subjects.length;i++) {
			if(i==0) subject = subjects[i];
			else subject += "," + subjects[i];
		}
	
		writer.println("<html>");
		writer.println("<head><title>성적입력</title></head>");
		writer.println("<body>");
		writer.println("학번 : " + request.getParameter("no"));
		writer.println("<br>");
		writer.println("이름 : " + request.getParameter("name"));
		writer.println("<br>");
		writer.println("국어 : " + request.getParameter("kor"));
		writer.println("<br>");
		writer.println("영어 : " + request.getParameter("eng"));
		writer.println("<br>");
		writer.println("수학 : " + request.getParameter("math"));
		writer.println("<br>");
		writer.println("합계 : " + total);
		writer.println("<br>");
		writer.printf("평균 : %.2f", avg);
		writer.println("<br>");
		writer.println("계열 : " + request.getParameter("major"));
		writer.println("<br>");
		writer.println("좋아하는 과목 : " + Arrays.toString( request.getParameterValues("subject")));
		writer.println("<br>");
		writer.println("좋아하는 과목(1개 문자열) : " + subject);
		writer.println("");
		writer.println("<br>");
		writer.println("주소 : " + request.getParameter("address"));
		writer.println("");
		writer.println("</body>");
		writer.println("</html>");
	
		writer.close();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
	}

}
