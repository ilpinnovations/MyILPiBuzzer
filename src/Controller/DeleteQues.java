package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

import DatabaseUtil.DatabaseUtil;
import bean.Question;

public class DeleteQues extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Connection cnn = null;
		ArrayList<Question> quesList = new ArrayList<Question>();
		HttpSession session = request.getSession();
		try {
			//Connection cnn = null;
			cnn = DatabaseUtil.getConnection();
			String quesid = request.getParameter("quesid");
			System.out.println(quesid);

			PreparedStatement st = cnn.prepareStatement(
					"delete from ibuzquestions where ques_id = ?");

			st.setString(1,quesid);
			int i = st.executeUpdate();
			if (i>0) {
				session.setAttribute("delete", "Success");
				request.getRequestDispatcher("DeleteQuestion").forward(request,
						response);

			} else{
				session.setAttribute("msg", "Failed");
				request.getRequestDispatcher("DeleteQuestion").forward(request,
						response);
			}

		}catch (NullPointerException e) {
			response.getWriter().write(
					"<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (CommunicationsException e) {
			response.getWriter()
					.write("<h1>Connection failure</h1><hr><h4>You are not connected to the internet</h4><p>Please connect to the internet and try again</p><br>");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
