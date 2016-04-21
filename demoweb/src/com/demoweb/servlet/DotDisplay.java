package com.demoweb.servlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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

		
		String[] index = fileInitIndex("test");
		String[] color = fileInitColor("test");
		
		req.setAttribute("index", index);
		req.setAttribute("color", color);

		String[] index2 = fileInitIndex("evolution");
		String[] color2 = fileInitColor("evolution");
		
		req.setAttribute("evolindex", index2);
		req.setAttribute("evolcolor", color2);
		
		String[] index3 = fileInitIndex("boomb");
		String[] color3 = fileInitColor("boomb");
		
		req.setAttribute("boomindex", index3);
		req.setAttribute("boomcolor", color3);
		
		String[] index4 = fileInitIndex("test2");
		String[] color4 = fileInitColor("test2");
		
		req.setAttribute("afterindex", index4);
		req.setAttribute("aftercolor", color4);
		
		
		System.out.println("initOk");
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/dot/display.jsp");
		dispatcher.forward(req, resp);

	}

	protected String[] fileInitIndex(String name) throws IOException {

		FileInputStream istream = new FileInputStream("/c:/dot/"+name+".txt");
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
		
		for (int i = 0; i < splitString.length; i++) {
			String[] temp = splitString[i].split(":");
			if (temp.length > 1) {
				index[i] = temp[0];
				color[i] = temp[1];
			
			}

		}

		breader.close();
		reader.close();
		istream.close();

		return index;
	}

	protected String[] fileInitColor(String name) throws IOException {

		FileInputStream istream = new FileInputStream("/c:/dot/"+name+".txt");
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
		
		for (int i = 0; i < splitString.length; i++) {
			String[] temp = splitString[i].split(":");
			if (temp.length > 1) {
				index[i] = temp[0];
				color[i] = temp[1];
			}

		}

		breader.close();
		reader.close();
		istream.close();

		return color;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);// 처리 내용이 같으므로 doGet으로 전달
	}

}
