package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import bean.AdoptionBean;
import bean.PetBean;
import bean.UserBean;
import util.DBConnection;

public class AdoptionDao {
	
	
	Connection conn = DBConnection.getConnection();
	
	
	public ArrayList<AdoptionBean> getAdoptionReportByDate(String from , String to)
	{
		Statement stmt=null;
		ResultSet rs = null;
		AdoptionBean adopt = null;
		ArrayList<AdoptionBean> adopted = new ArrayList<AdoptionBean>();
		if (conn!=null)
		{
			String sql = "select a.* , b.first_name,b.last_name, c.pet_name,d.category_name,e.breed_name from adoption_details a , user_details b, pet_details c,pet_categories d,pet_breeds e where a.user_id=b.user_id and a.pet_id=c.pet_id and c.breed_id=e.breed_id and e.category_id=d.category_id and a.adoption_date between to_date('"+ from + "','dd-mm-yyyy') and to_date('"+ to + "','dd-mm-yyyy')";
			try {
				stmt=conn.createStatement();
				
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					adopt = new AdoptionBean();
					adopt.setAdoption_id(rs.getInt(1));
					adopt.setUser_id(rs.getInt(2));
					adopt.setPet_id(rs.getInt(3));
					adopt.setAppointment_time(rs.getString(4));
					adopt.setAdoption_date(rs.getString(5));
					adopt.setUser_name(rs.getString(6) + " " + rs.getString(7));
					adopt.setPet_name(rs.getString(8));
					adopt.setPet_category(rs.getString(9));
					adopt.setPet_breed(rs.getString(10));
					adopted.add(adopt);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return adopted;
	}
	
	
	public ArrayList<AdoptionBean> getAdoptionReportByCategory(int id)
	{
		Statement stmt=null;
		ResultSet rs = null;
		AdoptionBean adopt = null;
		ArrayList<AdoptionBean> adopted = new ArrayList<AdoptionBean>();
		if (conn!=null)
		{
			String sql = "select a.* , b.first_name,b.last_name, c.pet_name,d.category_name,e.breed_name from adoption_details a , user_details b, pet_details c,pet_categories d,pet_breeds e where a.user_id=b.user_id and a.pet_id=c.pet_id and c.breed_id=e.breed_id and e.category_id=d.category_id and c.category_id="+id;
			try {
				stmt=conn.createStatement();
				
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					adopt = new AdoptionBean();
					adopt.setAdoption_id(rs.getInt(1));
					adopt.setUser_id(rs.getInt(2));
					adopt.setPet_id(rs.getInt(3));
					adopt.setAppointment_time(rs.getString(4));
					adopt.setAdoption_date(rs.getString(5));
					adopt.setUser_name(rs.getString(6) + " " + rs.getString(7));
					adopt.setPet_name(rs.getString(8));
					adopt.setPet_category(rs.getString(9));
					adopt.setPet_breed(rs.getString(10));
					adopted.add(adopt);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return adopted;
	}
	
	// ----------------------------- Get Specific Adoption
	public AdoptionBean getAdoption(int id)
	{
		AdoptionBean adopBean = new AdoptionBean();
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select user_id,pet_id,to_char(appointment_time, 'dd-mon-yyyy hh:mi:ss PM') from adoption_details where adoption_id=" +id;
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					adopBean.setUser_id(rs.getInt(1));
					adopBean.setPet_id(rs.getInt(2));
					adopBean.setAppointment_time(rs.getString(3));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			adopBean.setUser_name(new UserDao().getUserName(adopBean.getUser_id()));
			
		
		}
		
		return adopBean;
	}
	
	// ------- GETTING MAX ADOPTION ID --------
	public int getMaxAdoptionId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(adoption_id) from adoption_details";
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
	
	
	// ------------------------ INSERTING ADOPTION DETAILS ---------
	public int insertAdoption(AdoptionBean adopBean)
	{
		int rowAffected = 0;
		PreparedStatement stmt = null;
		boolean flag = false;
		if (conn != null) {
			String date=adopBean.getAdoption_date() + " " + adopBean.getAppointment_time();
			String insertOra = "insert into adoption_Details(adoption_id,user_id,pet_id,appointment_time) values(?,?,?,TO_DATE('"+ date + "','MM-DD-YYYY HH:MI PM'))";
			
			System.out.println("insertOra : "+insertOra);
			
			try {
				
				stmt = conn.prepareStatement(insertOra);
				//stmt.setString(1,"uid_gen.nextval");
				stmt.setInt(1, adopBean.getAdoption_id());
				stmt.setInt(2, adopBean.getUser_id());
				stmt.setInt(3, adopBean.getPet_id());
				//stmt.setString(4,date);
				rowAffected = stmt.executeUpdate();
				if (rowAffected > 0 && updateStatus(adopBean.getPet_id())>0) 
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
	
	public int updateStatus(int pid)
	{
		int rowAffected = 0;
		Statement stmt = null;
		//boolean flag = false;
		if (conn != null) {
			String cmd="update pet_details set status='N' where pet_id=" + pid;
			
			try {
				stmt=conn.createStatement();
				rowAffected=stmt.executeUpdate(cmd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
		}
		
		
		return rowAffected;
	}
	
	public  void  getTime()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select to_char(appointment_time, 'dd-mon-yyyy hh:mi:ss PM') from adoption_details";
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					
					System.out.println(rs.getString(1));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/*public static void main(String[] args) {
		AdoptionDao dao = new AdoptionDao();
		dao.getTime();
	}*/
	
	public ArrayList<AdoptionBean> getUserAdoptions(int uid)
	{
		Statement stmt = null;
		ResultSet rs = null;
		AdoptionBean qBean = null;
		ArrayList<AdoptionBean> qList = new ArrayList<AdoptionBean>();
		
		if (conn != null)
		{
			String sql = "select d.*,a.pet_name , b.category_name , c.breed_name ,a.health_details,a.age from pet_details a , pet_categories b , pet_breeds c , adoption_details d where a.pet_id=d.pet_id and a.category_id=b.category_id and a.breed_id=c.breed_id and user_id=" + uid;
			
			try {
				stmt = conn.createStatement();
				rs= stmt.executeQuery(sql);
				while(rs.next())
				{
					qBean = new AdoptionBean();
					qBean.setAdoption_id(rs.getInt(1));
					qBean.setUser_id(rs.getInt(2));
					qBean.setPet_id(rs.getInt(3));
					qBean.setAppointment_time(rs.getString(4));
					qBean.setAdoption_date(rs.getString(5));
					qBean.setPet_name(rs.getString(6));
					qBean.setPet_category(rs.getString(7));
					qBean.setPet_breed(rs.getString(8));
					qBean.setHealth_details(rs.getString(9));
					qBean.setAge(rs.getInt(10));
					qList.add(qBean);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return qList;
	}
}
