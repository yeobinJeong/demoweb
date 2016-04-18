package com.demoweb.servlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demoweb.dao.MemberDao;
import com.demoweb.dto.Member;

@WebServlet(value = "/dot/display.action")
public class DotDisplay extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		FileInputStream istream = new FileInputStream("/c:/dot/test.txt");
		InputStreamReader reader = new InputStreamReader(istream);
		BufferedReader breader = new BufferedReader(reader);
		String inputData = new String();
		while (true) {
			String line = breader.readLine();

			if (line == null) {
				break;
			}
			inputData += line;

		}

		String[] splitString = inputData.split("%");
		String[] index = new String[splitString.length];
		String[] color = new String[splitString.length];
		for(String str : splitString){
		System.out.println(str);}
		 for(int i =0; i<splitString.length; i++){
			String[] temp = splitString[i].split(":");
			if(temp.length >1){
				index[i] = temp[0];
				color[i] = temp[1];
				System.out.println("index : " + index[i]);
				System.out.println("color : " + color[i]);
			}
		 	
		 }

		breader.close();
		reader.close();
		istream.close();

		req.setAttribute("index", index);
		req.setAttribute("color", color);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/dot/display.jsp");
		dispatcher.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);// 처리 내용이 같으므로 doGet으로 전달
	}

}