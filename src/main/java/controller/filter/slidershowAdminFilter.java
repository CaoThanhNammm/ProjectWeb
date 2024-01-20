package controller.filter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

@WebFilter("/html/slidershowAdmin.jsp")
public class slidershowAdminFilter extends HttpFilter implements Filter {

	public slidershowAdminFilter() {
		super();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		File slidershowImgCurrent = new File(request.getServletContext().getRealPath("") + "/image/home/sliderShow");

		Map<String, String> mapImgs = new HashMap<>();

		for (String img : slidershowImgCurrent.list()) {
			mapImgs.put(img.substring(0, img.lastIndexOf(".")), "../image/home/sliderShow/" + img);
		}

		request.setAttribute("slidershowImgCurrent", mapImgs);
		chain.doFilter(request, response);
	}

}
