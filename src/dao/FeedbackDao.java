package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Feedback;

import util.DBConnection;

public class FeedbackDao {

	Connection conn = DBConnection.getConnection();
	
	
	public ArrayList<Feedback> getFeedbacks()
	{
		Statement stmt = null;
		ResultSet rs = null;
		Feedback fBean = null;
		ArrayList<Feedback> fList = new ArrayList<Feedback>();
		
		if (conn != null)
		{
			String sql = " select a.*,b.first_name from feedback_details a , user_details b where a.user_id=b.user_id";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new Feedback();
					fBean.setFeedback_id(rs.getInt(1));
					fBean.setUser_id(rs.getInt(2));
					fBean.setFeedback_text(rs.getString(3));
					fBean.setFeedback_date(rs.getString(4).substring(0,11));
					fBean.setUser_name(rs.getString(5));
					
					/*qBean = new FinancialDonationBean();
					qBean.setQuery_id(rs.getInt(1));
					qBean.setUser_id(rs.getInt(2));
					qBean.setQuery_text(rs.getString(3));
					qBean.setQuery_type(rs.getString(4));
					qBean.setQuery_ans(rs.getString(5));
					qBean.setQuery_sub_date(rs.getString(6));
					qBean.setQuery_ans_date(rs.getString(7));*/
					fList.add(fBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fList;
	}
	
	public int insertFeedback(Feedback fBean)
	{
		Statement stmt = null;
		//ResultSet rs = null;
		//Feedback fBean = null;
		int rowAffected = 0;
		if (conn!=null)
		{
			String sql="insert into feedback_details values(" + fBean.getFeedback_id() + "," + fBean.getUser_id() + ",'" 
		+ fBean.getFeedback_text() +"','" + fBean.getFeedback_date()+"')";
			try {
				stmt=conn.createStatement();
				rowAffected = stmt.executeUpdate(sql);
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return rowAffected;
		
	}
	
	public int getMaxFeedbackId()
	{
		Statement stmt = null;
		ResultSet rs = null;
		//Feedback fBean = null;
		int id=0;
		
		if (conn!=null)
		{
			String sql="select max(feedback_id) from feedback_details";
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					id=rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return id;
	}
	public Feedback getSpecificFeedback(int qid)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Feedback fBean = null;
		if (conn != null)
		{
			String sql = " select a.*,b.first_name from feedback_details a , user_details b where a.user_id=b.user_id and feedback_id="+qid;
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new Feedback();
					fBean.setFeedback_id(rs.getInt(1));
					fBean.setUser_id(rs.getInt(2));
					fBean.setFeedback_text(rs.getString(3));
					fBean.setFeedback_date(rs.getString(4).substring(0,11));
					fBean.setUser_name(rs.getString(5));
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fBean;
	}
	public ArrayList<Feedback> getUserFeedback(int uid)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Feedback fBean = null;
		ArrayList<Feedback> fList = new ArrayList<Feedback>();
		
		if (conn != null)
		{
			String sql = " select feedback_date , feedback_text from feedback_details where user_id="+uid;
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new Feedback();
					fBean.setFeedback_date(rs.getString(1));
					fBean.setFeedback_text(rs.getString(2));
					fList.add(fBean);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fList;
	}
	
	

	
}
