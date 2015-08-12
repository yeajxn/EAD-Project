package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.SignUpDB;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");
		String contact = request.getParameter("contact");

		if (!email.matches("^[A-Za-z0-9._%+-]{1,}[@]{1}[A-Za-z0-9._%+-]{1,}$")) {
			response.sendRedirect("register.jsp?msg=Invalid Email&cnfm=n");
		} else if (!name.matches("^[-'A-Za-z\\s]{1,50}$")) {
			response.sendRedirect("register.jsp?msg=Is that really your name??&cnfm=n");
		} else if (!passwd.matches("^(.){1,25}$")) {
			response.sendRedirect("register.jsp?msg=Invalid Password&cnfm=n");
		} else if (!contact.equals("")) {
			if (!contact.matches("^[0-9]{8}$")) {
				response.sendRedirect("register.jsp?msg=Invalid Phone number. Phone number must be 8 digits long.&cnfm=n");
			} else {
				SignUpDB signUpDb = new SignUpDB();
				if (signUpDb.signUp(email, name, passwd, contact) == true) {
					response.sendRedirect("login.jsp?msg=Your account has been created!");
				} else
					response.sendRedirect("register.jsp?msg=Sign Up Failed.&cnfm=n");
			}
		} else {
			SignUpDB signUpDb = new SignUpDB();
			if (signUpDb.signUpNoContact(email, name, passwd) == true) {
				response.sendRedirect("login.jsp?msg=Your account has been created!");
			} else
				response.sendRedirect("register.jsp?msg=Sign Up Failed.&cnfm=n");
		}
	}
}
