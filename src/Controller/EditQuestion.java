package Controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

import bean.Question;
import DatabaseUtil.DatabaseUtil;

public class EditQuestion extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection cnn = null;
		ArrayList<Question> quesList = new ArrayList<Question>();
		try {
			HttpSession session = request.getSession();
			String empid = session.getAttribute("empid").toString();
			String quesid = request.getParameter("quesid");
			String option1 = request.getParameter("option1");
			String option2 = request.getParameter("option2");
			String option3 = request.getParameter("option3");
			String option4 = request.getParameter("option4");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			System.out.println(option1);
			//Connection cnn = null;
			cnn = DatabaseUtil.getConnection();

			PreparedStatement st = cnn.prepareStatement(
					"update ibuzquestions set question=?,correct_ans=?,status=?,option1=?,option2=?,option3=?,option4=? where ques_id=?");
			st.setString(1, question);
			st.setString(2, answer);
			st.setString(3, "Active");
			st.setString(4, option1);
			st.setString(5, option2);
			st.setString(6, option3);
			st.setString(7, option4);

			st.setString(8, quesid);

			int i = st.executeUpdate();
			if (i > 0) {
				System.out.println("updated");
				session.setAttribute("edit", "Success");
				request.getRequestDispatcher("GetQuestions").forward(request, response);
			} else {
				session.setAttribute("edit", "Failed");
				request.getRequestDispatcher("GetQuestions").forward(request, response);
			}


		}catch (NullPointerException e) {
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (CommunicationsException e) {
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (SQLException e) {
			response.getWriter().write(
					"<h1>SQL connection failure</h1><hr><h4>Unable to communicate to the sql server</h4><p>Please check your connection and try again</p><br>");

			e.printStackTrace();
		}
	}
}
