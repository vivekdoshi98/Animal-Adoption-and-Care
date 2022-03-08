package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.QueryBean;
import util.DBConnection;

public class QueryDao {

	Connection conn = DBConnection.getConnection();
	
	public int getMaxQueryId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(query_id) from query_details";
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
	
	// -- INSERTING NEW QUERY === 
	public boolean insertQuery(QueryBean qBean)
	{
		PreparedStatement stmt = null;
		int row_eff = 0;
		boolean flag=false;
		//QueryBean qBean = null;
		if(conn != null)
		{
			String sql="insert into query_details(query_id,user_id,query_text,query_type,query_submission_date) values(?,?,?,?,?)";
			
			try {
				stmt=conn.prepareStatement(sql);
				stmt.setInt(1, qBean.getQuery_id());
				stmt.setInt(2, qBean.getUser_id());
				stmt.setString(3, qBean.getQuery_text());
				stmt.setString(4,qBean.getQuery_type());
				stmt.setString(5, qBean.getQuery_sub_date());
				row_eff=stmt.executeUpdate();
				if(row_eff >0)
				{
					flag=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
					
		}
		
		return flag;
	}
	// -- UPDATING QUERY RESPONSE 
	
	public int updateQueryResponse(String ans , int id)
	{
		PreparedStatement stmt = null;
		int rowAffected = 0;
		boolean flag=false;
		//QueryBean qBean = null;
		if(conn != null)
		{
			String sql="update Query_details set Query_answer=? where query_id=?";
			
			try {
				stmt=conn.prepareStatement(sql);
				stmt.setString(1, ans);
				stmt.setInt(2, id);
				rowAffected=stmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
					
		}
		
		return rowAffected;
	}
	
	
	
	//-- GET HEALTH QUERIES --
	public ArrayList<QueryBean> getHealthQueries()
	{
		Statement stmt = null;
		ResultSet rs = null;
		QueryBean qBean = null;
		ArrayList<QueryBean> qList = new ArrayList<QueryBean>();
		
		if (conn != null)
		{
			String sql = "select a.* , b.first_name from query_details a , user_details b where  a.user_id=b.user_id and query_type='H'";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					qBean = new QueryBean();
					qBean.setQuery_id(rs.getInt(1));
					qBean.setUser_id(rs.getInt(2));
					qBean.setQuery_text(rs.getString(3));
					qBean.setQuery_type(rs.getString(4));
					qBean.setQuery_ans(rs.getString(5));
					qBean.setQuery_sub_date(rs.getString(6).substring(0,11));
					qBean.setQuery_ans_date(rs.getString(7));
					qBean.setUser_name(rs.getString(8));
					qList.add(qBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return qList;
	}

	
	// --- GET NON HEALTH QUERIES --------
	public ArrayList<QueryBean> getNonHealthQueries()
	{
		Statement stmt = null;
		ResultSet rs = null;
		QueryBean qBean = null;
		ArrayList<QueryBean> qList = new ArrayList<QueryBean>();
		
		if (conn != null)
		{
			String sql = "select * from query_details where query_type='N'";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					qBean = new QueryBean();
					qBean.setQuery_id(rs.getInt(1));
					qBean.setUser_id(rs.getInt(2));
					qBean.setQuery_text(rs.getString(3));
					qBean.setQuery_type(rs.getString(4));
					qBean.setQuery_ans(rs.getString(5));
					qBean.setQuery_sub_date(rs.getString(6));
					qBean.setQuery_ans_date(rs.getString(7));
					qList.add(qBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return qList;
	}
	
	public ArrayList<QueryBean> getUserQueries(int uid)
	{
		Statement stmt = null;
		ResultSet rs = null;
		QueryBean qBean = null;
		ArrayList<QueryBean> qList = new ArrayList<QueryBean>();
		
		if (conn != null)
		{
			String sql = "select * from query_details where user_id=" + uid;
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					qBean = new QueryBean();
					qBean.setQuery_id(rs.getInt(1));
					qBean.setUser_id(rs.getInt(2));
					qBean.setQuery_text(rs.getString(3));
					qBean.setQuery_type(rs.getString(4));
					qBean.setQuery_ans(rs.getString(5));
					qBean.setQuery_sub_date(rs.getString(6));
					qBean.setQuery_ans_date(rs.getString(7));
					qList.add(qBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return qList;
	}
	public QueryBean getSpecificQueries(int uid)
	{
		Statement stmt = null;
		ResultSet rs = null;
		QueryBean qBean = null;
		
		if (conn != null)
		{
			String sql = "select a.* , b.first_name from query_details a , user_details b where a.user_id=b.user_id and query_id=" + uid;
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					qBean = new QueryBean();
					qBean.setQuery_id(rs.getInt(1));
					qBean.setUser_id(rs.getInt(2));
					qBean.setQuery_text(rs.getString(3));
					qBean.setQuery_type(rs.getString(4));
					qBean.setQuery_ans(rs.getString(5));
					qBean.setQuery_sub_date(rs.getString(6));
					qBean.setQuery_ans_date(rs.getString(7));
					qBean.setUser_name(rs.getString(8));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return qBean;
	}
}
