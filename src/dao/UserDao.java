package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.plaf.synth.SynthSeparatorUI;

import bean.UserBean;
import util.DBConnection;

public class UserDao {
	
	Connection conn = DBConnection.getConnection();
	
	
	/*public static void main(String[] args) {
		UserDao dao = new UserDao();
		dao.getAllAdmins();
	}
*/	
	// ------------------ FORGOT PASSWORD ---------------------
	
	public int forgotPassword(String email)
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select user_id from user_details where email='" + email +"'";
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					id=rs.getInt(1);
				}
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return id;
	}
	
	
	
	
	
	// -------------- GETTING MAX USERID------------------------------
	
	public int getMaxUserId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(user_id) from user_details";
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					id=rs.getInt(1);
				}
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return id;
	}
	
	
	public String getUserName(int id)
	{
		Statement stmt = null;
		ResultSet rs = null;
		String UserName = "";
		if (conn != null) {
			String selectOra = "select First_Name, Last_Name from user_details where user_id=" + id;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					UserName+= rs.getString(1) + " " + rs.getString(2);
					
					//userList.add(userBean);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

		}
		
		return UserName;	
	}
	// ------------------- GETTING USER DATA --------------------
	public UserBean getMyData(int id)
	{
		Statement stmt = null;
		ResultSet rs = null;
		UserBean userBean = null;
		if (conn != null) {
			String selectOra = "select * from user_details where user_id=" + id;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					userBean = new UserBean();
					userBean.setUser_id(rs.getInt(1));
					userBean.setPassword(rs.getString(2));
					userBean.setFirst_Name(rs.getString(3));
					userBean.setLast_Name(rs.getString(4));
					userBean.setEmail(rs.getString(5));
					userBean.setContact(rs.getString(6));
					userBean.setDob(rs.getString(7));
					userBean.setGender(rs.getString(8));
					userBean.setAddress_Line1(rs.getString(9));
					userBean.setAddress_Line2(rs.getString(10));
					userBean.setPincode(rs.getInt(11));
					userBean.setArea_id(rs.getInt(12));
					userBean.setUser_type_id(rs.getString(13));
					userBean.setPan_number(rs.getString(14));
					//userList.add(userBean);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

		}
		
		return userBean;

	}
	public ArrayList<UserBean> getAllAdmins()
	{
		Statement stmt = null;
		ResultSet rs = null;
		UserBean userBean = null;
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		if (conn != null) {
			String selectOra = "select * from user_details where user_type_id='1'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					userBean = new UserBean();
					userBean.setUser_id(rs.getInt(1));
					userBean.setPassword(rs.getString(2));
					userBean.setFirst_Name(rs.getString(3));
					userBean.setLast_Name(rs.getString(4));
					userBean.setEmail(rs.getString(5));
					userBean.setContact(rs.getString(6));
					userBean.setDob(rs.getString(7));
					userBean.setGender(rs.getString(8));
					userBean.setAddress_Line1(rs.getString(9));
					userBean.setAddress_Line2(rs.getString(10));
					userBean.setPincode(rs.getInt(11));
					userBean.setArea_id(rs.getInt(12));
					userBean.setUser_type_id(rs.getString(13));
					userBean.setPan_number(rs.getString(14));
					System.out.println(userBean.getDob());
					userList.add(userBean);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

		}
		
		return userList;
	}
	
	// ------------------------------------------------ GETTING VETS ------------------
	public ArrayList<UserBean> getAllVets()
	{
		Statement stmt = null;
		ResultSet rs = null;
		UserBean userBean = null;
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		if (conn != null) {
			String selectOra = "select * from user_details where user_type_id='2'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					userBean = new UserBean();
					userBean.setUser_id(rs.getInt(1));
					userBean.setPassword(rs.getString(2));
					userBean.setFirst_Name(rs.getString(3));
					userBean.setLast_Name(rs.getString(4));
					userBean.setEmail(rs.getString(5));
					userBean.setContact(rs.getString(6));
					userBean.setDob(rs.getString(7));
					userBean.setGender(rs.getString(8));
					userBean.setAddress_Line1(rs.getString(9));
					userBean.setAddress_Line2(rs.getString(10));
					userBean.setPincode(rs.getInt(11));
					userBean.setArea_id(rs.getInt(12));
					userBean.setUser_type_id(rs.getString(13));
					userBean.setPan_number(rs.getString(14));
					userList.add(userBean);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

		}
		
		return userList;
	}
	
	
	//-------------------------------------- getting type , id -------------------
	
	public int getTypeId(String e)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int id = 0;
	
		if (conn != null) {
			String selectOra = "select user_type_id from user_details where email='"+ e +"'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					id=rs.getInt(1);
					
				}
				stmt.close();
			} catch (SQLException f) {
				f.getStackTrace();
			}
			

		}
		return id;

	}
	public int getUserId(String e)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int id = 0;
	
		if (conn != null) {
			String selectOra = "select user_id from user_details where email='"+ e +"'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					id=rs.getInt(1);
					
				}
				stmt.close();
			} catch (SQLException f) {
				f.getStackTrace();
			}

		}
		return id;

	}
	// --------- checking if email pass correct ----------------------------------
	
	public boolean areCredentialsValid(String email, String pass)
	{
		boolean flag = false;
		Statement stmt = null;
		ResultSet rs = null;
		
	
		if (conn != null) {
			String selectOra = "select user_id from user_details where email='"+ email +"' AND password='"+pass+"'";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				if (rs.next()) {
					flag=true;
					
				}
				stmt.close();
			} catch (SQLException f) {
				f.getStackTrace();
			}

		}
		
		return flag;
	}
	
	
	
	
	
	
	
	// --------------------------Inserting Normal User-----------------------------------------
	
	public int insertNewUser(UserBean userBean)
	{
		int rowEffected = 0;
		PreparedStatement stmt = null;
		boolean flag = false;
		if (conn != null) {
			String insertOra = "insert into user_details(user_id,password,first_name,last_name,email,contact,dob,gender,user_type_id) values(uid_gen.nextval,?,?,?,?,?,?,?,?)";
			
			System.out.println("insertOra : "+insertOra);
			
			try {
				stmt = conn.prepareStatement(insertOra);
				//stmt.setString(1,"uid_gen.nextval");
				stmt.setString(1, userBean.getPassword());
				stmt.setString(2, userBean.getFirst_Name());
				stmt.setString(3, userBean.getLast_Name());
				stmt.setString(4, userBean.getEmail());
				stmt.setString(5, userBean.getContact());
				stmt.setString(6, userBean.getDob());
				stmt.setString(7, userBean.getGender());
				stmt.setString(8, userBean.getUser_type_id());
				rowEffected = stmt.executeUpdate();
				if (rowEffected > 0) 
				{
					flag = true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.println("Rows effected = " + rowEffected);
		}
		return rowEffected;
	}
	
	
	
	
	
	
	// ------------ INSERTING ADMIN AND VET ONLY ----------
	public int insertUser(UserBean userBean)
	{
		int rowEffected = 0;
		PreparedStatement stmt = null;
		boolean flag = false;
		if (conn != null) {
			String insertOra = "insert into user_details values(uid_gen.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			System.out.println("insertOra : "+insertOra);
			
			try {
				stmt = conn.prepareStatement(insertOra);
				//stmt.setString(1,"uid_gen.nextval");
				stmt.setString(1, userBean.getPassword());
				stmt.setString(2, userBean.getFirst_Name());
				stmt.setString(3, userBean.getLast_Name());
				stmt.setString(4, userBean.getEmail());
				stmt.setString(5, userBean.getContact());
				stmt.setString(6, userBean.getDob());
				stmt.setString(7, userBean.getGender());
				stmt.setString(8, userBean.getAddress_Line1());
				stmt.setString(9, userBean.getAddress_Line2());
				stmt.setInt(10, userBean.getPincode());
				stmt.setInt(11, userBean.getArea_id());
				stmt.setString(12, userBean.getUser_type_id());
				stmt.setString(13, userBean.getPan_number());
				
				rowEffected = stmt.executeUpdate();
				if (rowEffected > 0) 
				{
					flag = true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.println("Rows effected = " + rowEffected);
		}
		return rowEffected;
	}
	
	// ---------------- INSERT PERSONAL DETAILS OF NORMAL USER -------
	
	public int insertPersonalDetails(UserBean userBean)
	{
		
		try {
			conn.setAutoCommit(true);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int rowEffected = 0;
		Statement stmt = null;
		boolean flag = false;
		if (conn != null) {
			String insertOra = "update user_details set address_line1 ='"+ userBean.getAddress_Line1() + "',address_line2='"
					+ userBean.getAddress_Line2() + "',pincode="+userBean.getPincode()+","
							+ "area_id="+ userBean.getArea_id()+","
									+ "pan_number='" + userBean.getPan_number() + "'" 
					+ " where user_id="+userBean.getUser_id();
			
			System.out.println("insertOra : "+insertOra);
			
			try {
				stmt = conn.createStatement();
				
				/*stmt.setString(1, userBean.getAddress_Line1());
				stmt.setString(2, userBean.getAddress_Line2());
				stmt.setInt(3, userBean.getPincode());
				stmt.setInt(4, userBean.getArea_id());
				
				stmt.setString(5, userBean.getPan_number());
				System.out.println(rowEffected);
				rowEffected = stmt.executeUpdate();*/
				rowEffected = stmt.executeUpdate(insertOra);
				System.out.println(rowEffected);
				if (rowEffected > 0) 
				{
					flag = true;
				}
				else
				{
					System.out.println("error");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.println("Rows effected = " + rowEffected);
		}
		return rowEffected;
	}

	
	
	
	
	
	// ------ CHECKING EMAIL AVAILABILITY ------------
	public boolean isEmailAvailable(String email1)
	{
		Statement stmt = null;
		ResultSet rs = null;
		boolean flag=false;
		System.out.println("checking");
		if (conn != null) {
		String query ="select * from user_details where email='"+email1+"'";
		
		try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
	/*	System.out.println(rs.getString(0));
		String email1 = rs.getString(0);*/
		System.out.println(rs);
		
		if(rs.next())
		{
			System.out.println(rs.getString(3));
			flag= false;
		}
		else
		{
			System.out.println("available");
			flag = true;
		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		}
	return flag;	
	}

}
