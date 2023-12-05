package controller.filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class UTF8EncodingFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization code, if needed
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// Set the character encoding to UTF-8 for requests
		request.setCharacterEncoding("UTF-8");

		// Set the character encoding to UTF-8 for responses
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// Continue with the filter chain
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// Cleanup code, if needed
	}
}
