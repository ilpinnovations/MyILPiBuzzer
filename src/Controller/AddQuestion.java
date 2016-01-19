package Controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

import DatabaseUtil.DatabaseUtil;
import bean.Question;

public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Question> quesList = new ArrayList<Question>();
		Connection cnn = null;
			try {
			HttpSession session = request.getSession();
			cnn = DatabaseUtil.getConnection();
			String empid = session.getAttribute("empid").toString();
			String empName = session.getAttribute("empName").toString();
			String emploc = session.getAttribute("emploc").toString();
			String option1 = request.getParameter("option1");
			String option2 = request.getParameter("option2");
			String option3 = request.getParameter("option3");
			String option4 = request.getParameter("option4");
			String question = request.getParameter("question");
			String answer = request.getParameter("option");
			System.out.println(answer);
			PreparedStatement st2 = cnn.prepareStatement(
					"select * from ibuzquestions where emp_id=?");
			st2.setString(1, empid);
			
			ResultSet rs2=st2.executeQuery();
			if(DatabaseUtil.getRowCount(rs2)>20){
				session.setAttribute("msg", "Excess");
				response.sendRedirect("AddQuestion.jsp");
		
			}else{
		PreparedStatement st1 = cnn.prepareStatement(
					"select * from ibuzquestions where status=? and emp_id=?");
			st1.setString(1, "Active");
			st1.setString(2, empid);
			ResultSet rs=st1.executeQuery();
			if(DatabaseUtil.getRowCount(rs)>5){
				session.setAttribute("msg", "Failed");
				response.sendRedirect("AddQuestion.jsp");
		
			}else{
			PreparedStatement st = cnn.prepareStatement(
					"insert into ibuzquestions(emp_id,option1,option2,option3,option4,question,correct_ans,emp_loc,emp_name) values(?,?,?,?,?,?,?,?,?)");
			
			st.setString(1, empid);
			st.setString(2,option1);
			st.setString(3,option2);
			st.setString(4,option3);
			st.setString(5,option4);
			st.setString(6,question);
			st.setString(7,answer);
			st.setString(8, emploc);
			st.setString(9, empName);
			
			int i = st.executeUpdate();
			if (i>0) {
				session.setAttribute("msg", "Success");
				response.sendRedirect("AddQuestion.jsp");
			} else {
				session.setAttribute("msg", "Error");
				response.sendRedirect("AddQuestion.jsp");
			}
			}
			}
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