package controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/html/slidershowAdmin")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
		maxFileSize = 1024 * 1024 * 5, // 5 MB
		maxRequestSize = 1024 * 1024 * 5 * 5 // 25 MB
)
public class slidershowAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String FOLDER_SLIDERSHOW = "/image/home/sliderShow";
	public static final int WITDH = 1920;
	public static final int HEIGHT = 400;

	public slidershowAdmin() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String linkImgDelete = request.getParameter("link");
		File fileDelete = new File(request.getServletContext().getRealPath("") + linkImgDelete.substring(2));
		fileDelete.delete();

		File slidershowImgCurrent = new File(request.getServletContext().getRealPath("") + "/image/home/sliderShow");

		Map<String, String> mapImgs = new HashMap<>();

		for (String img : slidershowImgCurrent.list()) {
			mapImgs.put(img, "../image/home/sliderShow/" + img);
		}

		request.setAttribute("slidershowImgCurrent", mapImgs);
		request.getRequestDispatcher("/html/slidershowAdmin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			copyImgToFolder(part.getInputStream(), request.getServletContext().getRealPath(""),
					part.getSubmittedFileName());
		}

		File slidershowImgCurrent = new File(request.getServletContext().getRealPath("") + "/image/home/sliderShow");

		Map<String, String> mapImgs = new HashMap<>();

		for (String img : slidershowImgCurrent.list()) {
			mapImgs.put(img.substring(0, img.lastIndexOf(".")), "../image/home/sliderShow/" + img);
		}
		request.setAttribute("slidershowImgCurrent", mapImgs);

		request.getRequestDispatcher("/html/slidershowAdmin.jsp").forward(request, response);
	}

	private void copyImgToFolder(InputStream is, String root, String fileName) throws IOException {
		BufferedOutputStream bos = new BufferedOutputStream(
				new FileOutputStream(root + FOLDER_SLIDERSHOW + "/" + fileName));

		byte[] b = new byte[10240000];
		int data;
		while ((data = is.read(b)) != -1) {
			bos.write(b, 0, data);
		}

		bos.close();
		is.close();
	}
}
