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

import com.oracle.jrockit.jfr.RequestableEvent;

/**
 * Servlet Filter implementation class CharacterEncodingFilter
 */
@WebFilter("*.action")
public class CharacterEncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
	private String encoding;
	
    public CharacterEncodingFilter() {
    	
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		req.setCharacterEncoding(encoding);
		chain.doFilter(req, resp);
		
		HttpServletRequest request = (HttpServletRequest)req;
		
		if(request.getMethod().equalsIgnoreCase("post")){
			request.setCharacterEncoding(encoding);
		}
		
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		encoding = config.getInitParameter("encoding");
		if(encoding == null) {
			encoding ="UTF-8";
		}
	}

}
