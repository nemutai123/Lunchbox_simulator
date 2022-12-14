package com.smhrd.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.LunchBox_Detail;
import com.smhrd.model.RecipeboxDAO;

public class Send_lbseqCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {


		try {

			
			//======================================================
			RecipeboxDAO dao = new RecipeboxDAO();
			int lbnum = dao.select_lbnum();
			
			//도시락순번
			System.out.println("Send_lbseqCon");
			System.out.println("도시락 순번 : " + lbnum);
			//맴버 아이디
			HttpSession session = request.getSession();
			String session_mb_id = (String)session.getAttribute("sessionID");
			System.out.println("맴버아이디 : "+session_mb_id);
			
			
			
			
			
			response.setContentType("application/x-json; charset=utf-8");
			Gson gson = new Gson(); 
			
			String jsonnum = gson.toJson(lbnum+1);
			System.out.println("Select_lbnumCon");
			System.out.println("도시락 순번 : "+ jsonnum);
			
			
			
			
			PrintWriter out = response.getWriter();
			out.print(jsonnum);
			
			
		
		}
		
		catch(Exception e){
			System.out.println(e);
		}
		
		
		
		
		
		return null;
	}

}
