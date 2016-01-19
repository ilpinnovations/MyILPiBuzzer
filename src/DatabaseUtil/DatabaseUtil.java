package DatabaseUtil;

import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DatabaseUtil {
	static Connection cnn;
	static String HOST_ADDRESS = "160.153.89.96:3306";
	static String USERNAME = "jeet";
	static String PASSWORD = "J@447788";
	static String DATABASE_NAME = "schedulingnew";
	
	static{
		try {
				  
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
	}
	
	public static Connection getConnection(){
		try{
			if(cnn!=null){
				return cnn;
			}
			else{
				//cnn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo","root","root");  
			
				cnn = DriverManager.getConnection("jdbc:mysql://" + HOST_ADDRESS  + "/" + DATABASE_NAME,USERNAME,PASSWORD); 
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return cnn;
		
	}
	
	public static int getRowCount(ResultSet resultSet) {
	    if (resultSet == null) {
	        return 0;
	    }
	    try {
	        resultSet.last();
	        return resultSet.getRow();
	    } catch (SQLException exp) {
	        exp.printStackTrace();
	    } finally {
	        try {
	            resultSet.beforeFirst();
	        } catch (SQLException exp) {
	            exp.printStackTrace();
	        }
	    }
	    return 0;
	}
}
