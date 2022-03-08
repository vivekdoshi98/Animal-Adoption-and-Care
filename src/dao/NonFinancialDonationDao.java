package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.FinancialDonationBean;
import bean.NonFinancialDonationBean;
import util.DBConnection;

public class NonFinancialDonationDao {

	Connection conn = DBConnection.getConnection();
	
	
	// INSERTING DONATION --------------------
		public boolean insertDonation(NonFinancialDonationBean fBean)
		{
			PreparedStatement stmt = null;
			int row_eff = 0;
			boolean flag=false;
			String date=fBean.getAppointment_time();
			//QueryBean qBean = null;
			if(conn != null)
			{
				String sql="insert into non_financial_donation_details(nonfinancial_donation_id,user_id,donation_description,appointment_time) values(?,?,?,TO_DATE('"+ date + "','MM-DD-YYYY HH:MI PM'))";
				
				try {
					stmt=conn.prepareStatement(sql);
					stmt.setInt(1,fBean.getNon_financial_donation_id());
					stmt.setInt(2, fBean.getUser_id());
					stmt.setString(3, fBean.getDonation_desc());
					
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
	
	
	
	
	// GETTING MAX DONATION ID
	public int getMaxDonationId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(nonfinancial_donation_id) from non_financial_donation_details";
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
	
	
	
	public ArrayList<NonFinancialDonationBean> getNFDonationReportByDate(String from, String to)
	{
		Statement stmt = null;
		ResultSet rs = null;
		NonFinancialDonationBean fBean = null;
		ArrayList<NonFinancialDonationBean> fList = new ArrayList<NonFinancialDonationBean>();
		
		if (conn != null)
		{
			String sql = "select a.* , b.first_name,b.last_name from non_financial_donation_details a , user_details b where a.user_id=b.user_id and donation_date between to_date('"+ from + "','dd-mm-yyyy') and to_date('"+ to + "','dd-mm-yyyy')";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new NonFinancialDonationBean();
					fBean.setNon_financial_donation_id(rs.getInt(1));
					fBean.setUser_id(rs.getInt(2));
					fBean.setDonation_desc(rs.getString(3));
					fBean.setAppointment_time(rs.getString(4));
					fBean.setDonation_date(rs.getString(5));
					fBean.setFirst_name(rs.getString(6) + " " + rs.getString(7));
					fList.add(fBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fList;
	}

	
	public ArrayList<NonFinancialDonationBean> getNonFinancialDonations()
	{
		Statement stmt = null;
		ResultSet rs = null;
		NonFinancialDonationBean fBean = null;
		ArrayList<NonFinancialDonationBean> fList = new ArrayList<NonFinancialDonationBean>();
		
		if (conn != null)
		{
			String sql = "select a.* , b.first_name from non_financial_donation_details a , user_details b where a.user_id=b.user_id";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new NonFinancialDonationBean();
					fBean.setNon_financial_donation_id(rs.getInt(1));
					fBean.setUser_id(rs.getInt(2));
					fBean.setDonation_desc(rs.getString(3));
					fBean.setAppointment_time(rs.getString(4));
					fBean.setDonation_date(rs.getString(5));
					fBean.setFirst_name(rs.getString(6));
					
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
