package com.java.www;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S03")
public class S1103_03 extends HttpServlet {

	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		int page = Integer.parseInt(request.getParameter("page"));
		String searchword = request.getParameter("searchword");
		
		int s_row = (10*(page-1))+1;
		int e_row = 10*page;
		
		System.out.println("호출 페이지 : "+page);
		System.out.println(page+"페이지 첫 게시글 번호 : "+s_row);
		System.out.println(page+"페이지 마지막 게시글 번호 : "+e_row);
		System.out.println("검색어 : "+searchword);
		
		String query = "select * from"
				+ "(select row_number() over (order by bno desc) as rnum,"
				+ "bno,btitle,bcontent,bdate"
				+ " from board "
				+ "where bcontent like '%"+searchword+"%'"
				+ ") a where a.rnum>="+s_row+" and a.rnum<="+e_row;
		System.out.println("Oracle query구문 : "+query);
		
		
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
