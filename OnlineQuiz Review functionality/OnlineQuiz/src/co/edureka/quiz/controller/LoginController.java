package co.edureka.quiz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkLogin")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String u = "asd";
		String pass = "asd";
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (u.equals(username) && pass.equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", username);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/home.jsp");
			rd.forward(request, response);

		} else {
			request.setAttribute("errorMessage", "Invalid username or password");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsps/login.jsp");
			rd.forward(request, response);
		}

	}

}
