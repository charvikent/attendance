package com.charvikent.admin;

import java.io.*;
import java.sql.*;

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
@WebServlet("/EditStudentProfile")
public class EditStudentProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;

	@Override
	public void init() throws ServletException {
		String url = getServletContext().getInitParameter("url");
		String username = getServletContext().getInitParameter("username");
		String password = getServletContext().getInitParameter("password");
		con = DbUtility.getConnection(url, username, password);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		HttpSession sess = request.getSession();
		ServletContext sc = request.getServletContext();
		String path = sc.getRealPath("/upload/");

		// System.out.println(path);
		String imageName = null;
		String oldImageName = null;
		try {
			PreparedStatement ps = null;
			int i = 0;
			String sno = request.getParameter("sno");
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

			Part image = (Part) request.getPart("fileImage"); // request
																// parameter of
																// upload image
																// field
			imageName = getFileName(image);

			// String filename=image.getSubmittedFileName(); //to get the name
			// of the file
			// String contentType = image.getContentType(); // extension of
			// image
			// System.out.println("Image name is: "+filename+contentType);

			InputStream is = null;
			if (image != null && !image.equals("") && !imageName.equals("") && imageName != null) {
				is = image.getInputStream();
				InputStream isr2 = is;
				FileOutputStream f2 = new FileOutputStream(path + imageName); // downloads
																				// image
				int r2 = 0;
				while ((r2 = isr2.read()) != -1) {
					f2.write(r2);
				}
				f2.close();
				System.out.println("Image saved into given directory");
			}
			int size = (int) image.getSize();

			/*String sql1 = "SELECT * FROM addstudent where name='" + name + "' and board_name='" + board_name
					+ "' and medium='" + medium + "' and class_name='" + class_name + "' and section='" + section
					+ "' and roll_number='" + roll_number + "' and  admission_number='" + admission_number
					+ "' and father_name='" + father_name + "' and mobile='" + mobile + "' and alternate_number='"
					+ alternate_number + "' and email='" + email + "' and blood_group='" + blood_group
					+ "' and gender='" + gender + "' and dob='" + dob + "' and religion='" + religion
					+ "' and address='" + address + "' and previous_institute='" + previous_institute + "' and caste='"
					+ caste + "' and accommodation='" + accomodation + "' and bus_facility='" + bus_facility
					+ "' and bus_route='" + bus_route + "'";*/
			
			
			String sql1 = "SELECT * FROM addstudent where Sno='"+sno+"'";
			PreparedStatement ps1 = con.prepareStatement(sql1);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {
				oldImageName = rs.getString(23);
				
			} 
				// String query="update addstudent set
				// name='"+name+"',board_name='"+board_name+"',medium='"+medium+"',class_name='"+class_name+"',section='"+section+"',roll_number='"+roll_number+"',admission_number='"+admission_number+"',father_name='"+father_name+"',mobile='"+mobile+"',alternate_number='"+alternate_number+"',email='"+email+"',blood_group='"+blood_group+"',gender='"+gender+"',dob='"+dob+"',religion='"+religion+"',address='"+address+"',previous_institute='"+previous_institute+"',caste='"+caste+"',accommodation='"+accomodation+"',bus_facility='"+bus_facility+"',bus_route='"+bus_route+"'
				// where Sno='"+sno+"'";
				String query = "update addstudent set name=?, board_name=?, medium=?, class_name=?, section=?, roll_number=?, admission_number=?, father_name=?, mobile=?, alternate_number=?, email=?, blood_group=?, gender=?, dob=?, religion=?, address=?, previous_institute=?, caste=?, accommodation=?, bus_facility=?, bus_route=?, photo=? where Sno='"
						+ sno + "'";
				ps = con.prepareStatement(query);
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

				/*
				 * if(is != null) { ps.setBinaryStream(22,is,size); }
				 */
				if (imageName != null && !imageName.equals("")) {
					ps.setString(22, imageName);
				} else {
					ps.setString(22, oldImageName);
				}
				i = ps.executeUpdate();
				if (i >= 0) {
					System.out.println("Student details updated in DB");
					String updated = "Successfully Updated the Profile :-)";
					sess.setAttribute("updated", updated);
					response.sendRedirect("view_student.jsp");
				} else {
					String error = "Failed to Update Profile..please try again later.";
					sess.setAttribute("error", error);
					response.sendRedirect("view_student.jsp");
				}
		} // try closed here
		catch (Exception e) {
			pw.println(e);
			e.printStackTrace();
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
