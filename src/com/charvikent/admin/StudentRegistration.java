package com.charvikent.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.charvikent.dbconnection.DbUtility;

@MultipartConfig
@WebServlet(name = "StudentRegistration", urlPatterns = { "/StudentRegistration" })
public class StudentRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;

	@Override
	public void init() throws ServletException {
		String url = getServletContext().getInitParameter("url");
		String username = getServletContext().getInitParameter("username");
		String password = getServletContext().getInitParameter("password");
		con = DbUtility.getConnection(url, username, password);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		HttpSession sess = request.getSession();
		ServletContext sc = request.getServletContext();
		String path = sc.getRealPath("/upload/");
		// String path=sc.getContextPath();
		System.out.println(path);
		String filePath =  System.getProperty("catalina.base");
		String absoluteDiskPath = getServletContext().getRealPath("/WEB-INF");

		String imageName = null;
		try {

			String name = request.getParameter("name");
			String board_name = request.getParameter("board");
			String medium = request.getParameter("medium");
			String class_name = request.getParameter("clas");
			String section = request.getParameter("section");
			String roll_number = request.getParameter("rollno");
			String admission_number = request.getParameter("admissionno");
			String father_name = request.getParameter("fname");
			String mobile = request.getParameter("mobile");
			String alternate_number = request.getParameter("altmobile");
			String email = request.getParameter("email");
			String blood_group = request.getParameter("bgroup");
			String gender = request.getParameter("gender");
			String dob = request.getParameter("dob");
			String religion = request.getParameter("religion");
			String address = request.getParameter("address");
			String previous_institute = request.getParameter("pinstitute");
			String caste = request.getParameter("caste");
			String accomodation = request.getParameter("accomodation");
			String bus_facility = request.getParameter("busfacility");
			String bus_route = request.getParameter("busroute");
			
			Part image = (Part) request.getPart("fileImage");
			imageName = getFileName(image);
			System.out.println(getFileName(image));
			// request parameter of upload image field
			System.out.println(image.getName());
			// String filename=image.getSubmittedFileName(); //to get the name of the file
			// String contentType = image.getContentType(); // extension of image
			// System.out.println("Image name is: "+filename+contentType);

			InputStream is = null;
			if (image != null) {
				is = image.getInputStream();
				InputStream isr2 = is;
				FileOutputStream f2 = new FileOutputStream(path + imageName); // downloads
																								// image
				int r2 = 0;
				while ((r2 = isr2.read()) != -1) {
					f2.write(r2);
				}
				System.out.println("Image saved into given directory");
			}
			int size = (int) image.getSize();

			String sql1 = "SELECT * FROM addstudent where admission_number='" + admission_number + "'";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {
				sess.setAttribute("error", "Already Existed Record");
				sess.setAttribute("nam", name);
				sess.setAttribute("brd", board_name);
				sess.setAttribute("mdm", medium);
				sess.setAttribute("cls_nam", class_name);
				sess.setAttribute("sct", section);
				sess.setAttribute("rlno", roll_number);
				sess.setAttribute("adno", admission_number);
				sess.setAttribute("fnam", father_name);
				sess.setAttribute("mbl", mobile);
				sess.setAttribute("altr", alternate_number);
				sess.setAttribute("eml", email);
				sess.setAttribute("bg", blood_group);
				sess.setAttribute("gnd", gender);
				sess.setAttribute("db", dob);
				sess.setAttribute("rlgn", religion);
				sess.setAttribute("adr", address);
				sess.setAttribute("pri", previous_institute);
				sess.setAttribute("cast", caste);
				sess.setAttribute("acdm", accomodation);
				sess.setAttribute("busfc", bus_facility);
				sess.setAttribute("busrt", bus_route);
				response.sendRedirect("add_student.jsp");
			} else {
				// String sql2="insert into addstudent
				// values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,DATE_FORMAT(NOW(),'%b
				// %d %Y %h:%i %p'))";
				String sql2 = "insert into addstudent values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
				PreparedStatement ps = con.prepareStatement(sql2);
				ps.setString(1, name);
				ps.setString(2, board_name);
				ps.setString(3, medium);
				ps.setString(4, class_name);
				ps.setString(5, section);
				ps.setString(6, roll_number);
				ps.setString(7, admission_number);
				ps.setString(8, father_name);
				ps.setString(9, mobile);
				ps.setString(10, alternate_number);
				ps.setString(11, email);
				ps.setString(12, blood_group);
				ps.setString(13, gender);
				ps.setString(14, dob);
				ps.setString(15, religion);
				ps.setString(16, address);
				ps.setString(17, previous_institute);
				ps.setString(18, caste);
				ps.setString(19, accomodation);
				ps.setString(20, bus_facility);
				ps.setString(21, bus_route);

				/*if (is != null) {
					ps.setBinaryStream(22, is, size);
				}*/
				ps.setString(22, imageName);

				int i = ps.executeUpdate();
				if (i >= 0) {
					System.out.println("Student details inserted into DB");
					String registered = "Successfully Registered :-)";
					sess.setAttribute("registered", registered);
					response.sendRedirect("add_student.jsp");
				} // if closed here
				else {
					String error = "Registration Failed..please try again later.";
					sess.setAttribute("error", error);
					response.sendRedirect("add_student.jsp");
				}
			}
		} // try closed here
		catch (Exception e) {
			pw.println(e);
		}
	}

	// get the image name
	private String getFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
