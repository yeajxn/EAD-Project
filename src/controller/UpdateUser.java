package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UpdateUserDB;
import model.UserDetails;
import model.UserDetailsDB;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUser() {
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
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String password = request.getParameter("password");

		// Validate fields
		if (name.equals("") | name == null) {
			response.sendRedirect("Profile.jsp?msg=Don't forget your name!");
		} else if (email == "" | email == null) {
			response.sendRedirect("Profile.jsp?msg=Please enter an email");
		} else if (password.equals("") | password == null) {
			response.sendRedirect("Profile.jsp?msg=Can't leave password empty!");
		} else if (!name.matches("^[-'A-Za-z\\s]{1,50}$")) {
			response.sendRedirect("Profile.jsp?msg=That's a weird name....s");
		} else if (!email
				.matches("^[A-Za-z0-9._%+-]{1,}[@]{1}[A-Za-z0-9._%+-]{1,}$")) {
			response.sendRedirect("Profile.jsp?msg=Please enter a password");
		} else if (!password.matches("^(.){1,25}$")) {
			response.sendRedirect("Profile.jsp?msg=Invalid Password");
		} else if (contact != null | !contact.equals("")) {
			if (!contact.matches("^[0-9]{8}$")) {
				response.sendRedirect("Profile.jsp?msg=Invalid phone number!");
			} else if (!address.matches("^['\\sA-Za-z0-9#\\-]{0,200}$")) {
				response.sendRedirect("Profile.jsp?msg=Invalid address!");
			} else
			// Proceed to update
			{
				HttpSession Session = request.getSession();
				UserDetails user = (UserDetails) Session.getAttribute("user");
				UserDetailsDB userDB = new UserDetailsDB();
				int ID = userDB.getUserID(user.getEmail());
				UpdateUserDB upUser = new UpdateUserDB();
				boolean update = upUser.updateUser(name, email, contact,
						address, password, ID);
				if (update != true)
					response.sendRedirect("Profile.jsp?msg=Update Failed");
				else {
					user.setAddress(address);
					user.setContact(contact);
					user.setEmail(email);
					user.setName(name);
					user.setPassword(password);
					Session.setAttribute("user", user);
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/Profile.jsp?msg=Updated!");
					dispatcher.include(request, response);
				}
			}
		}
	}
}
