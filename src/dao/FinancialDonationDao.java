package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.FinancialDonationBean;
import bean.QueryBean;
import util.DBConnection;

public class FinancialDonationDao {

	Connection conn = DBConnection.getConnection();
	
	// INSERTING DONATION --------------------
	public boolean insertDonation(FinancialDonationBean fBean)
	{
		PreparedStatement stmt = null;
		int row_eff = 0;
		boolean flag=false;
		//QueryBean qBean = null;
		if(conn != null)
		{
			String sql="insert into financial_donation_details(financial_donation_id,user_id,payment_amount,payment_date,payment_reference_number) values(?,?,?,?,?)";
			
			try {
				stmt=conn.prepareStatement(sql);
				stmt.setInt(1,fBean.getFinancial_donation_id());
				stmt.setInt(2, fBean.getUser_id());
				stmt.setDouble(3, fBean.getPayment_amount());
				stmt.setString(4,fBean.getPayment_date());
				stmt.setString(5, fBean.getPayment_reference_number());
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
	
	
	
	
	
	// -- GETTING MAX DONATION ID
	public int getMaxDonationId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(financial_donation_id) from financial_donation_details";
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
	
	
	
	public ArrayList<FinancialDonationBean> getReportDonationByUsers()
	{
		Statement stmt = null;
		ResultSet rs = null;
		FinancialDonationBean fBean = null;
		ArrayList<FinancialDonationBean> fList = new ArrayList<FinancialDonationBean>();
		
		if (conn != null)
		{
			String sql = "select sum(a.payment_amount),a.user_id,b.first_name,b.last_name from financial_donation_details a,user_details b where a.user_id=b.user_id group by a.user_id, b.first_name,b.last_name";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new FinancialDonationBean();
					fBean.setPayment_amount(rs.getDouble(1));
					fBean.setUser_id(rs.getInt(2));
					
					fBean.setFirst_name(rs.getString(3) + " " + rs.getString(4));
					fList.add(fBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fList;
	}
	
	// FINANCIAL DONATION REPORT
	public ArrayList<FinancialDonationBean> getFDonationReportByDate(String from, String to)
	{
		Statement stmt = null;
		ResultSet rs = null;
		FinancialDonationBean fBean = null;
		ArrayList<FinancialDonationBean> fList = new ArrayList<FinancialDonationBean>();
		
		if (conn != null)
		{
			String sql = "select a.* , b.first_name,b.last_name from financial_donation_details a , user_details b where a.user_id=b.user_id and payment_date between to_date('"+ from + "','dd-mm-yyyy') and to_date('"+ to + "','dd-mm-yyyy')";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new FinancialDonationBean();
					fBean.setFinancial_donation_id(rs.getInt(1));
					fBean.setUser_id(rs.getInt(2));
					fBean.setPayment_type(rs.getString(3));
					fBean.setPayment_amount(rs.getDouble(4));
					fBean.setPayment_date(rs.getString(5));
					fBean.setPayment_reference_number(rs.getString(6));
					fBean.setFirst_name(rs.getString(7) + " " + rs.getString(8));
					fList.add(fBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fList;
	}

	
	
	public ArrayList<FinancialDonationBean> getFinancialDonations()
	{
		Statement stmt = null;
		ResultSet rs = null;
		FinancialDonationBean fBean = null;
		ArrayList<FinancialDonationBean> fList = new ArrayList<FinancialDonationBean>();
		
		if (conn != null)
		{
			String sql = "select a.* , b.first_name,b.last_name from financial_donation_details a , user_details b where a.user_id=b.user_id";
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new FinancialDonationBean();
					fBean.setFinancial_donation_id(rs.getInt(1));
					fBean.setUser_id(rs.getInt(2));
					fBean.setPayment_type(rs.getString(3));
					fBean.setPayment_amount(rs.getDouble(4));
					fBean.setPayment_date(rs.getString(5));
					fBean.setPayment_reference_number(rs.getString(6));
					fBean.setFirst_name(rs.getString(7) + " " + rs.getString(8));
					fList.add(fBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fList;
	}
	
	public ArrayList<FinancialDonationBean> getUserDonations(int id)
	{
		Statement stmt = null;
		ResultSet rs = null;
		FinancialDonationBean fBean = null;
		ArrayList<FinancialDonationBean> fList = new ArrayList<FinancialDonationBean>();
		
		if (conn != null)
		{
			String sql = "select a.* , b.first_name,b.last_name from financial_donation_details a , user_details b where a.user_id=b.user_id and a.user_id="+id;
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					
					fBean= new FinancialDonationBean();
					fBean.setFinancial_donation_id(rs.getInt(1));
					fBean.setUser_id(rs.getInt(2));
					fBean.setPayment_type(rs.getString(3));
					fBean.setPayment_amount(rs.getDouble(4));
					fBean.setPayment_date(rs.getString(5));
					fBean.setPayment_reference_number(rs.getString(6));
					fBean.setFirst_name(rs.getString(7) + " " + rs.getString(8));
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
