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

import javax.servlet.RequestDispatcher;
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

public class DeleteQuestion extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Question> quesList = new ArrayList<Question>();
		Connection cnn = null;
		try {
			HttpSession session = request.getSession();
			//Connection cnn = null;
				cnn = DatabaseUtil.getConnection();

				PreparedStatement st = cnn
						.prepareStatement("SELECT ques_id,question FROM ibuzquestions WHERE emp_id = ?");

				st.setString(1, session.getAttribute("empid").toString());
				ResultSet rSet = st.executeQuery();
				if(DatabaseUtil.getRowCount(rSet)>0){
				while (rSet.next()) {
					String quesID = rSet.getString("ques_id");
					String ques = rSet.getString("question");
					Question q = new Question();
					q.setQues(ques);
					q.setQuesid(quesID);
					quesList.add(q);
				}
				request.setAttribute("quesList", quesList);
				request.getRequestDispatcher("DeleteQuestion.jsp").forward(
						request, response);

				} else {
					session.setAttribute("msg", "Failed");
					response.sendRedirect("DeleteQuestion.jsp");
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
