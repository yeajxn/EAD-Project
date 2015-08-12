package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class GetSalesReport
 */
@WebServlet("/GetSalesReport")
public class GetSalesReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetSalesReport() {
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
		String month = request.getParameter("month");
		String monthTxt = "";
		if (month.equals("1")) {
			monthTxt = "January";
		}
		if (month.equals("2")) {
			monthTxt = "February";
		}
		if (month.equals("3")) {
			monthTxt = "March";
		}
		if (month.equals("4")) {
			monthTxt = "April";
		}
		if (month.equals("5")) {
			monthTxt = "May";
		}
		if (month.equals("6")) {
			monthTxt = "June";
		}
		if (month.equals("7")) {
			monthTxt = "July";
		}
		if (month.equals("8")) {
			monthTxt = "August";
		}
		if (month.equals("9")) {
			monthTxt = "September";
		}
		if (month.equals("10")) {
			monthTxt = "October";
		}
		if (month.equals("11")) {
			monthTxt = "Novemeber";
		}
		if (month.equals("12")) {
			monthTxt = "December";
		}
		String year = request.getParameter("year");
		String sort = request.getParameter("sort");
		if (sort.equals("tra")) {
			String ReportType = "tra";
			SalesReportDB srDB = new SalesReportDB();
			ArrayList<SalesRepTransactions> List = srDB.TransactionsList(month,
					year);
			HttpSession Session = request.getSession();
			Session.setAttribute("Report", List);
			Session.setAttribute("ReportType", ReportType);
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(
							"/SalesReport.jsp?month=" + monthTxt + "&year="
									+ year);
			dispatcher.include(request, response);
		}
		if (sort.equals("pro")) {
			String ReportType = "pro";
			SalesReportDB srDB = new SalesReportDB();
			ArrayList<SalesRepProducts> List = srDB.ProductsList(month, year);
			HttpSession Session = request.getSession();
			Session.setAttribute("Report", List);
			Session.setAttribute("ReportType", ReportType);
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(
							"/SalesReport.jsp?month=" + monthTxt + "&year="
									+ year);
			dispatcher.include(request, response);
		}
	}

}
