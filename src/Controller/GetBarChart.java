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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

import DatabaseUtil.DatabaseUtil;
import bean.Question;

public class GetBarChart extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		getBarChart2(request, response);
		getBarChart3(request, response);
		request.getRequestDispatcher("GetQuesId").forward(request, response);

	}

	private void getBarChart2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Connection cnn = null;
		try {
			ArrayList<Question> quesList = new ArrayList<Question>();
		HttpSession session = request.getSession();
		int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;
			//Connection cnn = null;
			cnn = DatabaseUtil.getConnection();
			String quesid = request.getParameter("sel");
			System.out.println(quesid);
			PreparedStatement st1 = cnn.prepareStatement(
					"select count(*) from emp_loc where ques_id = ? and emp_loc=?");
			st1.setString(1, quesid);
			st1.setString(2, "Trivandrum");
			ResultSet rs1 = st1.executeQuery();
			PreparedStatement st2 = cnn.prepareStatement(
					"select count(*) from emp_loc where ques_id = ? and emp_loc=?");
			st2.setString(1, quesid);
			st2.setString(2, "Hyderabad");
			ResultSet rs2 = st2.executeQuery();
			PreparedStatement st3 = cnn.prepareStatement(
					"select count(*) from emp_loc where ques_id = ? and emp_loc=?");
			st3.setString(1, quesid);
			st3.setString(2, "Chennai");
			ResultSet rs3 = st3.executeQuery();
			PreparedStatement st4 = cnn.prepareStatement(
					"select count(*) from emp_loc where ques_id = ? and emp_loc=?");
			st4.setString(1, quesid);
			st4.setString(2, "Ahmedabad");
			ResultSet rs4 = st4.executeQuery();
			PreparedStatement st5 = cnn.prepareStatement(
					"select count(*) from emp_loc where ques_id = ? and emp_loc=?");
			st5.setString(1, quesid);
			st5.setString(2, "Guwahati");
			ResultSet rs5 = st5.executeQuery();
			while(rs1.next()) {
				c1 = rs1.getInt(1);
				System.out.println(c1);
			}
			while(rs2.next()) {
				c2 = rs2.getInt(1);
				System.out.println(c2);
			}
			if (rs3.next()) {
				c3 = rs3.getInt(1);
			}
			if (rs4.next()) {
				c4 = rs4.getInt(1);
			}
			if (rs5.next()) {
				c5 = rs5.getInt(1);
			}
			int c[] = new int[] { c1, c2, c3, c4, c5 };
			JSONObject obj = new JSONObject();
			JSONArray arr = new JSONArray();
			JSONObject mainObject = new JSONObject();
			try{
			for (int i = 0; i < 5; i++) {

				obj.put("count", c[i]);

				arr.put(obj);
				obj = new JSONObject();
			}
			mainObject.put("data", arr);
			System.out.println(mainObject);
			session.setAttribute("json2", mainObject);
			} catch (JSONException je) {
				je.printStackTrace();
			}
		
		}catch (NullPointerException e) {
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		}catch (CommunicationsException e) {
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (SQLException e) {
			response.getWriter().write(
					"<h1>SQL connection failure</h1><hr><h4>Unable to communicate to the sql server</h4><p>Please check your connection and try again</p><br>");

			e.printStackTrace();
		}
		
	}

	private void getBarChart3(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			ArrayList<Question> quesList = new ArrayList<Question>();
		HttpSession session = request.getSession();
		int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;
			Connection cnn = null;
			cnn = DatabaseUtil.getConnection();
			String quesid = request.getParameter("sel");

			PreparedStatement st1 = cnn.prepareStatement(
					"select count(*) from emp_option where ques_id = ? and answer=1");
			st1.setString(1, quesid);
			ResultSet rs1 = st1.executeQuery();
			PreparedStatement st2 = cnn.prepareStatement(
					"select count(*) from emp_option where ques_id = ? and answer=2");
			st2.setString(1, quesid);
			ResultSet rs2 = st2.executeQuery();
			PreparedStatement st3 = cnn.prepareStatement(
					"select count(*) from emp_option where ques_id = ? and answer=3");
			st3.setString(1, quesid);
			ResultSet rs3 = st3.executeQuery();
			PreparedStatement st4 = cnn.prepareStatement(
					"select count(*) from emp_option where ques_id = ? and answer=4");
			st4.setString(1, quesid);
			ResultSet rs4 = st4.executeQuery();
			if (rs1.next()) {
				c1 = rs1.getInt(1);
			}
			if (rs2.next()) {
				c2 = rs2.getInt(1);
			}
			if (rs3.next()) {
				c3 = rs3.getInt(1);
			}
			if (rs4.next()) {
				c4 = rs4.getInt(1);
			}
			int c[] = new int[] { c1, c2, c3, c4};
			JSONObject obj = new JSONObject();
			JSONArray arr = new JSONArray();
			JSONObject mainObject = new JSONObject();
			try{
			for (int i = 0; i < 4; i++) {

				obj.put("count", c[i]);

				arr.put(obj);
				obj = new JSONObject();
			}
			mainObject.put("data", arr);
			System.out.println(mainObject);
			session.setAttribute("json3", mainObject);
			} catch (JSONException je) {
				je.printStackTrace();
			}
	

		} catch (SQLException e) {
			response.getWriter().write(
					"<h1>SQL connection failure</h1><hr><h4>Unable to communicate to the sql server</h4><p>Please check your connection and try again</p><br>");

			e.printStackTrace();
		}

	}
}
