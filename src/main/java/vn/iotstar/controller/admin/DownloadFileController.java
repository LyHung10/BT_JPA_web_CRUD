package vn.iotstar.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.utils.Constant;
@WebServlet(urlPatterns = {"/image"})
public class DownloadFileController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = req.getParameter("fname");
		File file = new File(Constant.UPLOAD_DIRECTORY + "/" + fileName);
		resp.setContentType("image/jpeg");
		if (file.exists()) {
		IOUtils.copy(new FileInputStream(file), resp.getOutputStream());
		}
	}
}
