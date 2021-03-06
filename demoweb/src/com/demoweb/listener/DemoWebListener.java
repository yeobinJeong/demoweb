package com.demoweb.listener;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class DemoWebListener
 *
 */
@WebListener
public class DemoWebListener implements ServletContextListener, HttpSessionListener {

	/**
	 * Default constructor.
	 */
	public DemoWebListener() {
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent arg0) {
		ServletContext application = arg0.getSession().getServletContext();
		
		
		
		int total = (int) application.getAttribute("total");
		int current = (int) application.getAttribute("current");

		application.setAttribute("total", total + 1);
		application.setAttribute("current", current + 1);
	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent arg0) {
		ServletContext application = arg0.getSession().getServletContext();
		int current = (int) application.getAttribute("current");
		application.setAttribute("current", current - 1);
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// 누적 접속자 수를 저장( 파일, DB)
		ServletContext application = arg0.getServletContext();
		int total = (int) application.getAttribute("total");
		
		String path = application.getInitParameter("path");
		path = application.getRealPath("/WEB-INF/counter.txt");
		FileOutputStream fos = null;
		PrintStream ps = null;
		try {
			fos = new FileOutputStream(path);
			ps = new PrintStream(fos);
			ps.print(total);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {ps.close();} catch (Exception ex) {}
			try {fos.close();} catch (Exception ex) {}
		}
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent arg0) {
		// 웹 애플리케이션이 시작될 때 값 초기화
		
		ServletContext application = arg0.getServletContext();
		
	
		try{
			
			String path = application.getInitParameter("path");
					path = application.getRealPath("/WEB-INF/counter.txt");
			File file = new File(path);
			
			if( file.exists()){
				FileInputStream fis = new FileInputStream(file);
				InputStreamReader r = new InputStreamReader(fis);
				BufferedReader br = new BufferedReader(r);
				
				String total = br.readLine();
				application.setAttribute("total", Integer.parseInt(total));
				br.close();
				r.close();
				fis.close();
				
			} else {
				application.setAttribute("total", 0);
			}
			
		}catch(Exception e){application.setAttribute("total", 0);};
		
		application.setAttribute("current", 0);
	}

}
