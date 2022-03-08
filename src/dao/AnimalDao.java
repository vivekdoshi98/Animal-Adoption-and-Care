package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import bean.Feedback;
import util.DBConnection;

public class AnimalDao {
	Connection conn = DBConnection.getConnection();
/*	public static void main(String[] args) {
		AnimalDao dao = new AnimalDao();
		if(dao.insert())
		{
			System.out.println("hey");
		}
	}*/
	
	
	public boolean insert(Feedback f) {
		int rowEffected=0;
		boolean flag=false;
		Statement stmt = null;
	if (conn != null)
	{
		String insQuery= "insert into feedback_details values(" + f.getFeedback_id() + "," + f.getUser_id() + ",'" + f.getFeedback_text() + "','" + f.getFeedback_date() + "')";
		try {
			stmt = conn.createStatement();
			rowEffected = stmt.executeUpdate(insQuery);
			if (rowEffected > 0) 
			{
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("Rows effected = " + rowEffected);
		
	
	
	//return true;
	}
	return flag;
	}
	
}

