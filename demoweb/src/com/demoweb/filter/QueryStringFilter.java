package com.demoweb.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demoweb.dto.Member;

@WebFilter("*.action")
public class QueryStringFilter implements Filter {

    public QueryStringFilter() {    }
	public void destroy() {	}
	
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		String uri = req.getRequestURI();
		
		if (uri.contains("/board/")) {	//경로에 /board/가 포함된 경우
			//요청된 페이지 번호 읽기 (없으면 1로 설정)
			String pageNo = req.getParameter("pageno");
			int currentPage = 1; //현재 페이지 번호
			if (pageNo != null && pageNo.length() > 0) {
				currentPage = Integer.parseInt(pageNo);
			}
			//현재 페이지 번호를 request에 저장 -> jsp에서 사용
			req.setAttribute("pageno", currentPage);
		}
		
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}






