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

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter("*.action")
public class AuthFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		//uri에 따라 들어가거나 안들어 가게 하려는 설정
		String uri = req.getRequestURI();
		Member member = (Member)req.getSession().getAttribute("loginuser");
		
		if(uri.contains("/member/")){
			
			if(member ==null || !member.getUserType().equals("admin") ){
				resp.sendRedirect("/demoweb/account/loginform.action");
				return;
			}
			
		} else if(uri.contains("/upload/") || uri.contains("/board/")){
			
			if(member == null || !member.getUserType().equals("admin") ){
				resp.sendRedirect("/demoweb/account/loginform.action");
				return;
			}
			
		} 
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
