package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.ClinicBean;
import util.DBConnection;

public class ClinicDao {
	Connection conn = DBConnection.getConnection();
	public ArrayList<ClinicBean> getAllClinics()
	{
		ResultSet rs =null;
		Statement stmt= null;
		ClinicBean cBean = null;
		ArrayList<ClinicBean> clinicList = new ArrayList<ClinicBean>();
		if (conn != null)
		{
			String selectClinic = " select * from clinic_details";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectClinic);
				
				while(rs.next())
				{
					cBean = new ClinicBean();
					cBean.setClinic_id(rs.getInt(1));
					cBean.setClinic_name(rs.getString(2));
					cBean.setClinic_owner(rs.getString(3));
					cBean.setCl_addressLine1(rs.getString(4));
					cBean.setCl_addressLine2(rs.getString(5));
					cBean.setCl_pincode(rs.getInt(6));
					cBean.setArea_id(rs.getInt(7));
					cBean.setContact(rs.getString(8));
					cBean.setLocation(rs.getString(9));
					cBean.setWebsite(rs.getString(10));
					clinicList.add(cBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return clinicList;
		
		
	}
	
	public int getMaxClinicId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(clinic_id) from clinic_details";
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
	
	public int insertClinic(ClinicBean clinicBean)
	{
		int rowAffected = 0;
		PreparedStatement stmt = null;
		boolean flag = false;
		if (conn != null) {
			//String date= admitBean.getAppointment_time();
			String insertOra = "insert into clinic_details values(?,?,?,?,?,?,?,?,?,?))";
			
			//System.out.println("insertOra : "+insertOra);
			
			try {
				
				stmt = conn.prepareStatement(insertOra);
				//stmt.setString(1,"uid_gen.nextval");
				/*stmt.setInt(1, clinicBean.getAdmission_id());
				stmt.setInt(2, admitBean.getUser_id());
				stmt.setInt(3, admitBean.getPet_id());
				*///stmt.setString(4,date);
				
				stmt.setInt(1, (getMaxClinicId()+1));
				stmt.setString(2, clinicBean.getClinic_name());
				stmt.setString(3, clinicBean.getClinic_owner());
				stmt.setString(4, clinicBean.getCl_addressLine1());
				stmt.setString(5, clinicBean.getCl_addressLine2());
				stmt.setInt(6, clinicBean.getCl_pincode());
				stmt.setInt(7, clinicBean.getArea_id());
				stmt.setString(8, clinicBean.getContact());
				stmt.setString(9, clinicBean.getLocation());
				stmt.setString(10, clinicBean.getWebsite());
				
							
				rowAffected = stmt.executeUpdate();
				if (rowAffected > 0) 
				{
					flag = true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.println("Rows effected = " + rowAffected);
		}
	
		
		return rowAffected;
		
	}

}
