package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;

import DatabaseUtil.DatabaseUtil;

public class MyThread extends Thread {

	public void run() {
		System.out.println("MyThread running");
		Connection con = DatabaseUtil.getConnection();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from ibuzquestions where status=?");
			ps.setString(1, "Active");
			Timestamp startD = null;
			Timestamp endD = null;
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Calendar cal = Calendar.getInstance();
				java.sql.Timestamp sqldate1 = new java.sql.Timestamp(cal.getTimeInMillis());
				startD = sqldate1;
				Calendar cal1 = Calendar.getInstance();
				cal1.add(Calendar.MINUTE, -30);
				java.sql.Timestamp sqldate2 = new java.sql.Timestamp(cal1.getTimeInMillis());
				endD = sqldate2;
				System.out.println(startD);
				System.out.println(endD);
				con = DatabaseUtil.getConnection();
				PreparedStatement ps2=con.prepareStatement("update ibuzquestions set status=? where submit_time not between ? and ?");
			    ps2.setString(1, "Inactive");
				ps2.setTimestamp(2,startD);
				ps2.setTimestamp(3, endD);
				int i=ps2.executeUpdate();
				if(i>0){
					System.out.println("Status updated");
				}else{
					System.out.println("Could not update the status");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}