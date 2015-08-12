package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class authenticate
 */
@WebServlet("/authenticate")
public class authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public authenticate() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Boolean admin, login;

		if (!email.matches("^[A-Za-z0-9._%+-]{1,}[@]{1}[A-Za-z0-9._%+-]{1,}$")
				&& email.length() > 50) {
			response.sendRedirect("login.jsp?msg=Invalid Email/Password");
		} else if (!password.matches("(.){8,25}")) {
			response.sendRedirect("login.jsp?msg=Invalid Email/Password");
		} else {
			authenticateDB authenticate = new authenticateDB();
			login = authenticate.login(email, password);
			if (login == true) {
				admin = authenticate.admin();
				if (admin == true) {
					HttpSession Session = request.getSession();
					Session.setAttribute("status", admin);
					Session.setAttribute("email", email);
					UserDetails user = new UserDetails();
					UserDetailsDB userDB = new UserDetailsDB();
					user = userDB.getUserDetails(email);
					Session.setAttribute("user", user);
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/adminHome.jsp");
					dispatcher.include(request, response);
				} else {
					HttpSession Session = request.getSession();
					Session.setAttribute("status", admin);
					Session.setAttribute("email", email);
					UserDetails user = new UserDetails();
					UserDetailsDB userDB = new UserDetailsDB();
					user = userDB.getUserDetails(email);
					Session.setAttribute("user", user);
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/index.jsp");
					dispatcher.include(request, response);
				}
			} else
				response.sendRedirect("login.jsp?msg=Invalid Email/Password");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
