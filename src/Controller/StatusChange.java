package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

import DatabaseUtil.DatabaseUtil;
import bean.Question;

public class StatusChange extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String quesid = request.getParameter("quesid");
		String s = request.getParameter("status");
		System.out.println("s="+s);
		int i = 0;
		Connection cnn=null;
		try {
			HttpSession session = request.getSession();
			
			cnn = DatabaseUtil.getConnection();
			if (s.equals("inactive")) {
				PreparedStatement st1 = cnn.prepareStatement("update ibuzquestions set status=? WHERE ques_id = ?");
				st1.setString(1, ""
						+ "Inactive");

				st1.setString(2, quesid);
				i = st1.executeUpdate();
				if (i > 0) {
					session.setAttribute("deactivate", "Success");
					request.getRequestDispatcher("Status").forward(request, response);
				}
			} else if(s.equals("active")){
				PreparedStatement st = cnn.prepareStatement("update ibuzquestions set status=? WHERE ques_id = ?");
				st.setString(1, "Active");

				st.setString(2, quesid);
				i = st.executeUpdate();
				if (i > 0) {
					session.setAttribute("activate", "Success");
					request.getRequestDispatcher("Status").forward(request, response);
				}
			}


		}catch (NullPointerException e) {
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (CommunicationsException e) {
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		}catch (SQLException e) {
			response.getWriter().write(
					"<h1>SQL connection failure</h1><hr><h4>Unable to communicate to the sql server</h4><p>Please check your connection and try again</p><br>");

			e.printStackTrace();
		}
	}

}
