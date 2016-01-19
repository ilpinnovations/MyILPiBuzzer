package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

import DatabaseUtil.DatabaseUtil;
import bean.Question;

public class GetQues extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Connection cnn = null;
		ArrayList<Question> quesList = new ArrayList<Question>();
		try {
			HttpSession session = request.getSession();
			//Connection cnn = null;
				cnn = DatabaseUtil.getConnection();
				//MyThread m=new MyThread();
				//m.start();
				PreparedStatement st = cnn
						.prepareStatement("SELECT ques_id,question,correct_ans,status,option1,option2,option3,option4 FROM ibuzquestions WHERE emp_id = ?");

				st.setString(1, session.getAttribute("empid").toString());
				ResultSet rSet = st.executeQuery();
				if(DatabaseUtil.getRowCount(rSet)>0){
				while (rSet.next()) {
					String quesID = rSet.getString("ques_id");
					String ques = rSet.getString("question");
					String correct_ans = rSet.getString("correct_ans");
					String status = rSet.getString("status");
					String option1 = rSet.getString("option1");
					String option2 = rSet.getString("option2");
					String option3 = rSet.getString("option3");
					String option4 = rSet.getString("option4");
					Question q = new Question();
					final int ans = Integer.parseInt(correct_ans);
					q.setQues(ques);
					q.setQuesid(quesID);
					q.setOption1(option1);
					q.setOption2(option2);
					q.setOption3(option3);
					q.setOption4(option4);
					switch (ans) {
					case 1:
						q.setCorrectAnswer(option1);
						break;
					case 2:
						q.setCorrectAnswer(option2);
						break;
					case 3:
						q.setCorrectAnswer(option3);
						break;
					case 4:
						q.setCorrectAnswer(option4);
						break;
					default:
						System.out.println("wrong choice");
						break;
					}
					quesList.add(q);
				}
				request.setAttribute("quesList", quesList);
				request.getRequestDispatcher("Dashboard.jsp").forward(request,
						response);				
		
				} else {
					session.setAttribute("msg", "Failed");
					response.sendRedirect("Dashboard.jsp");
			}
				

		} catch (NullPointerException e) {
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
}
	
