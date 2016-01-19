package Controller;

import java.io.IOException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

import DatabaseUtil.DatabaseUtil;

public class LoginUser extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection cnn = null;
		try {
			HttpSession session = request.getSession();
				cnn = DatabaseUtil.getConnection();

				PreparedStatement st = cnn
						.prepareStatement("SELECT emp_id,emp_name,emp_loc FROM emp_reg WHERE emp_id = ? AND emp_email = ?");

				st.setString(1, request.getParameter("empid"));
				st.setString(2, request.getParameter("emailid"));

				ResultSet rSet = st.executeQuery();

				if (rSet.next()) {
					session.setAttribute("empName", rSet.getString("emp_name"));
					session.setAttribute("empid", rSet.getString("emp_id"));
					session.setAttribute("emploc", rSet.getString("emp_loc"));
					
					System.out.println("Success");
					request.getRequestDispatcher("GetQues").forward(request, response);

		
				} else {
					session.setAttribute("msg", "Failed");
					response.sendRedirect("signin.jsp");
				}
				
		} catch (NullPointerException e) {
			System.out.println("1");
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (CommunicationsException e) {
			System.out.println("2");
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (SQLException e) {
			System.out.println("3");
			response.getWriter().write(
					"<h1>SQL connection failure</h1><hr><h4>Unable to communicate to the sql server</h4><p>Please check your connection and try again</p><br>");

			e.printStackTrace();
		}	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}