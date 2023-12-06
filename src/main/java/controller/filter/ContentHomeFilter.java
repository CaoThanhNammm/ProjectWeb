package controller.filter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;


@WebFilter({ "/html/product.jsp", "/index/*" })
public class ContentHomeFilter extends HttpFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		File imgSliderShow = new File("Web\\ProjectWeb\\src\\main\\webapp\\image\\home\\sliderShow");
		
		List<String> imgs = new ArrayList<>();
		int totalImg = 0;
		
		for (File child : imgSliderShow.listFiles()) {
			imgs.add(child.getName());
			totalImg++;
		}
		
		request.setAttribute("imgSliderShow", imgs);
		request.setAttribute("totalDot", totalImg);
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
