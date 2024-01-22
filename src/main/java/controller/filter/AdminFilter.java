package controller.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

@WebFilter("/html/*")
public class AdminFilter extends HttpFilter implements Filter {
	private boolean check = false;
	private static final long serialVersionUID = 1L;
	private long count = 0;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String url = ((HttpServletRequest) request).getRequestURI();
		((HttpServletRequest) request).getSession().setAttribute("count-access", count);
		if(count == 0) {
			resest(2592000);
		}
		if (url.contains("Admin")) {
			count -= 1;
			Account ac = (Account) ((HttpServletRequest) request).getSession().getAttribute("account");
			if (ac != null && ac.getRole().isAdmin()) {
				if (!check) {
					check = true;
					((HttpServletResponse) response).sendRedirect(url.substring(url.lastIndexOf("/") + 1));
				}
			} else {
				((HttpServletResponse) response).sendRedirect("../html/login.jsp");
			}
		}
		count += 1;
		chain.doFilter(request, response);
	}

	private void resest(long time) {
		ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
		scheduler.schedule(() -> {
			count = 0;
			scheduler.shutdown(); // Đóng scheduler sau khi công việc hoàn thành
		}, time, TimeUnit.SECONDS);
	}

}
