package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.plaf.synth.SynthSeparatorUI;

import bean.AdmissionBean;
import bean.AdoptionBean;
import bean.PetBean;
import util.DBConnection;

public class PetDao {
		
	Connection conn = DBConnection.getConnection();
	
	public ArrayList<PetBean> getPetReportByAge(int from_age,int to_age)
	{
		Statement stmt = null;
		//Statement stmt1 = null;
		ResultSet rs = null;
		//ResultSet rs1 = null;
		ArrayList<PetBean> petList = new ArrayList<PetBean>();
		if (conn != null) {
			String getPet = "select a.*,c.category_name, b.breed_name  from pet_details a, pet_categories c, pet_breeds b where a.category_id=c.category_id and a.breed_id=b.breed_id and b.category_id=c.category_id and a.age between "+from_age+" and "+to_age;
			//int r = 2;
			//String getPet= "select a.*,i.image_path from pet_details a inner join pet_images i on a.pet_id=i.pet_id where rownum < " + r;
			//String getPet= "select a.*,i.image_path from pet_details a , pet_images i where a.pet_id = (select max(i.pet_id) from pet_images where i.pet_id=a.pet_id)";
			//System.out.println("heyyyyyy");
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(getPet);
				
				while(rs.next())
				{
					
					//System.out.println("hey");
					PetBean petBean = new PetBean();
					petBean.setPet_id(rs.getInt(1));
					petBean.setPet_name(rs.getString(2));
					petBean.setCatergory_id(rs.getInt(3));
					petBean.setBreed_id(rs.getInt(4));
					petBean.setAge(rs.getInt(5));
					petBean.setGender(rs.getString(6));
					petBean.setColor(rs.getString(7));
					petBean.setStatus(rs.getString(8));
					petBean.setVet_id(rs.getInt(9));
					petBean.setHealth_details(rs.getString(10));
					petBean.setCategory_Name(rs.getString(11));
					petBean.setBreed_name(rs.getString(12));
					
					petBean.setImage1(getImagePath(petBean.getPet_id()));
					petList.add(petBean);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return petList;
	}
	
	
	// ------------------------ pet by category REPORT -----]
	public ArrayList<PetBean> getPetReportByCategory(int id)
	{
		Statement stmt = null;
		//Statement stmt1 = null;
		ResultSet rs = null;
		//ResultSet rs1 = null;
		ArrayList<PetBean> petList = new ArrayList<PetBean>();
		if (conn != null) {
			String getPet = "select a.*,c.category_name, b.breed_name  from pet_details a, pet_categories c, pet_breeds b where a.category_id=c.category_id and a.breed_id=b.breed_id and b.category_id=c.category_id and a.category_id="+id;
			//int r = 2;
			//String getPet= "select a.*,i.image_path from pet_details a inner join pet_images i on a.pet_id=i.pet_id where rownum < " + r;
			//String getPet= "select a.*,i.image_path from pet_details a , pet_images i where a.pet_id = (select max(i.pet_id) from pet_images where i.pet_id=a.pet_id)";
			//System.out.println("heyyyyyy");
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(getPet);
				
				while(rs.next())
				{
					
					//System.out.println("hey");
					PetBean petBean = new PetBean();
					petBean.setPet_id(rs.getInt(1));
					petBean.setPet_name(rs.getString(2));
					petBean.setCatergory_id(rs.getInt(3));
					petBean.setBreed_id(rs.getInt(4));
					petBean.setAge(rs.getInt(5));
					petBean.setGender(rs.getString(6));
					petBean.setColor(rs.getString(7));
					petBean.setStatus(rs.getString(8));
					petBean.setVet_id(rs.getInt(9));
					petBean.setHealth_details(rs.getString(10));
					petBean.setCategory_Name(rs.getString(11));
					petBean.setBreed_name(rs.getString(12));
					
					petBean.setImage1(getImagePath(petBean.getPet_id()));
					petList.add(petBean);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return petList;
	}
	
	
	
	
	// -------------------   get max image id of pet from pet_images
	public int getMaxImageId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(image_id) from pet_images";
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
	
	public int insertPetImage(PetBean p)
	{
		int rowAffected=0;
		int id = (new PetDao().getMaxImageId()) + 1;
		Statement stmt = null;
		boolean flag = false;
		if (conn != null) {
			String insertOra = "insert into pet_images values("+id+ ",'"+ p.getImage1() + "'," + p.getPet_id() + ")";
			
			System.out.println("insertOra : "+insertOra);
			
			try {
				stmt=conn.createStatement();
				rowAffected = stmt.executeUpdate(insertOra);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//System.out.println("Rows effected = " + rowEffected);
		}
		return rowAffected;
	}
	
	public boolean insertAdmissionpet(PetBean p)
	{
		int rowAffected,imageAffected=0;
		PreparedStatement stmt = null;
		boolean flag = false;
		if (conn != null) {
			String insertOra = "insert into pet_details(pet_id,pet_name,category_id,breed_id,age,gender,color,status) values(?,?,?,?,?,?,?,'U')";
			
			System.out.println("insertOra : "+insertOra);
			
			try {
				stmt = conn.prepareStatement(insertOra);
				//stmt.setString(1,"uid_gen.nextval");
				stmt.setInt(1, p.getPet_id());
				stmt.setString(2, p.getPet_name());
				stmt.setInt(3, p.getCatergory_id());
				stmt.setInt(4, p.getBreed_id());
				stmt.setInt(5,p.getAge());
				stmt.setString(6, p.getGender());
				stmt.setString(7, p.getColor());
				rowAffected = stmt.executeUpdate();
				
				imageAffected = new PetDao().insertPetImage(p);
				if(rowAffected > 0 && imageAffected > 0)
				{
					flag = true;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//System.out.println("Rows effected = " + rowEffected);
		}
		return flag;
	}
	
	
	/// GET MAX PET ID ----------- 
	public int getMaxPetId()
	{
		int id=0;
		Statement stmt = null;
		ResultSet rs = null;
		//QueryBean qBean = null;
		if (conn!=null)
		{
			String sql="select max(pet_id) from pet_details";
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

	
	
	
	public ArrayList<AdoptionBean> getAdoptedPets()
	{
		Statement stmt=null;
		ResultSet rs = null;
		AdoptionBean adopt = null;
		ArrayList<AdoptionBean> adopted = new ArrayList<AdoptionBean>();
		if (conn!=null)
		{
			String sql = "select a.* , b.first_name, c.pet_name from adoption_details a , user_details b, pet_details c where a.user_id=b.user_id and a.pet_id=c.pet_id";
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
					adopt.setUser_name(rs.getString(6));
					adopt.setPet_name(rs.getString(7));
					
					adopted.add(adopt);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return adopted;
	}
	
	public ArrayList<AdmissionBean> getAdmittedPets()
	{
		Statement stmt=null;
		ResultSet rs = null;
		AdmissionBean admit = null;
		ArrayList<AdmissionBean> admitted = new ArrayList<AdmissionBean>();
		if (conn!=null)
		{
			String sql = "select a.* , b.first_name , c.pet_name from admission_details a , user_details b , pet_details c where a.user_id=b.user_id and a.pet_id=c.pet_id";
			try {
				stmt=conn.createStatement();
				
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					admit = new AdmissionBean();
					admit.setAdmission_id(rs.getInt(1));
					admit.setUser_id(rs.getInt(2));
					admit.setPet_id(rs.getInt(3));
					admit.setAppointment_time(rs.getString(4));
					admit.setAdmission_date(rs.getString(5));
					admit.setUser_name(rs.getString(6));
					admit.setPet_name(rs.getString(7));
					admitted.add(admit);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return admitted;
	}
	
	// ------ GET SPECIFIC PET -----------------
	public PetBean getPet(int id)
	{
		Statement stmt = null;
		ResultSet rs = null;
		PetBean petBean = new PetBean();
		if (conn!=null)
		{
			String sql = "select a.pet_name,c.category_name,b.breed_name from pet_details a,pet_breeds b,pet_categories c where a.pet_id=" + id + " and a.category_id=c.category_id and a.breed_id=b.breed_id and b.category_id=c.category_id";
			try {
				stmt=conn.createStatement();
				
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					petBean.setPet_name(rs.getString(1));
					petBean.setCategory_Name(rs.getString(2));
					petBean.setBreed_name(rs.getString(3));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return petBean;
	}
	// ----------- GET AVAILABLE PETS
	public ArrayList<PetBean> getAvailablePets()
	{
		Statement stmt = null;
		//Statement stmt1 = null;
		ResultSet rs = null;
		//ResultSet rs1 = null;
		ArrayList<PetBean> petList = new ArrayList<PetBean>();
		if (conn != null) {
			String getPet = "select a.*,c.category_name, b.breed_name  from pet_details a, pet_categories c, pet_breeds b where a.category_id=c.category_id and a.breed_id=b.breed_id and b.category_id=c.category_id and a.status='A'";
			int r = 2;
			//String getPet= "select a.*,i.image_path from pet_details a inner join pet_images i on a.pet_id=i.pet_id where rownum < " + r;
			//String getPet= "select a.*,i.image_path from pet_details a , pet_images i where a.pet_id = (select max(i.pet_id) from pet_images where i.pet_id=a.pet_id)";
			//System.out.println("heyyyyyy");
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(getPet);
				
				while(rs.next())
				{
					
					//System.out.println("hey");
					PetBean petBean = new PetBean();
					petBean.setPet_id(rs.getInt(1));
					petBean.setPet_name(rs.getString(2));
					petBean.setCatergory_id(rs.getInt(3));
					petBean.setBreed_id(rs.getInt(4));
					petBean.setAge(rs.getInt(5));
					petBean.setGender(rs.getString(6));
					petBean.setColor(rs.getString(7));
					petBean.setStatus(rs.getString(8));
					petBean.setVet_id(rs.getInt(9));
					petBean.setHealth_details(rs.getString(10));
					petBean.setCategory_Name(rs.getString(11));
					petBean.setBreed_name(rs.getString(12));
					
					petBean.setImage1(getImagePath(petBean.getPet_id()));
					petList.add(petBean);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return petList;
	}
	
	
	
	//----------- GET ALLL PETS -----------------
	public ArrayList<PetBean> getAllPets()
	{
		Statement stmt = null;
		//Statement stmt1 = null;
		ResultSet rs = null;
		//ResultSet rs1 = null;
		ArrayList<PetBean> petList = new ArrayList<PetBean>();
		if (conn != null) {
			String getPet = "select a.*,c.category_name, b.breed_name , d.first_name from pet_details a, pet_categories c, pet_breeds b ,user_details d where a.category_id=c.category_id and a.breed_id=b.breed_id and b.category_id=c.category_id and a.vet_id=d.user_id";
			int r = 2;
			//String getPet= "select a.*,i.image_path from pet_details a inner join pet_images i on a.pet_id=i.pet_id where rownum < " + r;
			//String getPet= "select a.*,i.image_path from pet_details a , pet_images i where a.pet_id = (select max(i.pet_id) from pet_images where i.pet_id=a.pet_id)";
			//System.out.println("heyyyyyy");
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(getPet);
				
				while(rs.next())
				{
					
					//System.out.println("hey");
					PetBean petBean = new PetBean();
					petBean.setPet_id(rs.getInt(1));
					petBean.setPet_name(rs.getString(2));
					petBean.setCatergory_id(rs.getInt(3));
					petBean.setBreed_id(rs.getInt(4));
					petBean.setAge(rs.getInt(5));
					petBean.setGender(rs.getString(6));
					petBean.setColor(rs.getString(7));
					petBean.setStatus(rs.getString(8));
					petBean.setVet_id(rs.getInt(9));
					petBean.setHealth_details(rs.getString(10));
					petBean.setCategory_Name(rs.getString(11));
					petBean.setBreed_name(rs.getString(12));
					petBean.setVet_name(rs.getString(13));
					petBean.setImage1(getImagePath(petBean.getPet_id()));
					petList.add(petBean);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return petList;
	}
	public String getImagePath(int id)
	{
		int image_id=0;
		//System.out.println(id);
		ResultSet rs = null;
		Statement stmt = null;
		String imgpath="";
		String getimg="select max(image_id) from pet_images where pet_id=" +id;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(getimg);
			//System.out.println("outside");
			if(rs.next()) {
			//System.out.println("inside");
			image_id=rs.getInt(1);
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select image_path from pet_images where image_id="+image_id);
			if(rs.next()) {
				//System.out.println("inside");
				imgpath=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return imgpath;	
	}
	
	public ArrayList<PetBean> getPetByCategory_Breed(int cid,int bid)
	{
		Statement stmt = null;
		//Statement stmt1 = null;
		ResultSet rs = null;
		//ResultSet rs1 = null;
		ArrayList<PetBean> petList = new ArrayList<PetBean>();
		PetBean petBean = null;
		
		if (conn != null) {
			String getPet = "select a.*,c.category_name, b.breed_name from pet_details a, pet_categories c, pet_breeds b  where a.breed_id=b.breed_id and b.category_id=c.category_id and a.category_id="+cid+" and a.breed_id="+bid;
			//int r = 2;
			//String getPet= "select a.*,i.image_path from pet_details a inner join pet_images i on a.pet_id=i.pet_id where rownum < " + r;
			//String getPet= "select a.*,i.image_path from pet_details a , pet_images i where a.pet_id = (select max(i.pet_id) from pet_images where i.pet_id=a.pet_id)";
			//System.out.println("heyyyyyy");
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(getPet);
				
				while(rs.next())
				{
					petBean = new PetBean();
					//System.out.println("hey");
					petBean.setPet_id(rs.getInt(1));
					petBean.setPet_name(rs.getString(2));
					petBean.setCatergory_id(rs.getInt(3));
					petBean.setBreed_id(rs.getInt(4));
					petBean.setAge(rs.getInt(5));
					petBean.setGender(rs.getString(6));
					petBean.setColor(rs.getString(7));
					petBean.setStatus(rs.getString(8));
					petBean.setVet_id(rs.getInt(9));
					petBean.setHealth_details(rs.getString(10));
					petBean.setCategory_Name(rs.getString(11));
					petBean.setBreed_name(rs.getString(12));
					
					
					petBean.setImage1(getImagePath(petBean.getPet_id()));
					
					petList.add(petBean);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return petList;
	}
	
	
	// click edit admin
	public PetBean getSpecificPet(int pid)
	{
		Statement stmt = null;
		//Statement stmt1 = null;
		ResultSet rs = null;
		//ResultSet rs1 = null;
		PetBean petBean = new PetBean();
		
		if (conn != null) {
			String getPet = "select a.*,c.category_name, b.breed_name , d.first_name from pet_details a, pet_categories c, pet_breeds b ,user_details d where a.category_id=c.category_id and a.breed_id=b.breed_id and b.category_id=c.category_id and a.vet_id=d.user_id and a.pet_id="+pid;
			//int r = 2;
			//String getPet= "select a.*,i.image_path from pet_details a inner join pet_images i on a.pet_id=i.pet_id where rownum < " + r;
			//String getPet= "select a.*,i.image_path from pet_details a , pet_images i where a.pet_id = (select max(i.pet_id) from pet_images where i.pet_id=a.pet_id)";
			//System.out.println("heyyyyyy");
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(getPet);
				
				while(rs.next())
				{
					
					//System.out.println("hey");
					petBean.setPet_id(rs.getInt(1));
					petBean.setPet_name(rs.getString(2));
					petBean.setCatergory_id(rs.getInt(3));
					petBean.setBreed_id(rs.getInt(4));
					petBean.setAge(rs.getInt(5));
					petBean.setGender(rs.getString(6));
					petBean.setColor(rs.getString(7));
					petBean.setStatus(rs.getString(8));
					petBean.setVet_id(rs.getInt(9));
					petBean.setHealth_details(rs.getString(10));
					petBean.setCategory_Name(rs.getString(11));
					petBean.setBreed_name(rs.getString(12));
					petBean.setVet_name(rs.getString(13));
					
					petBean.setImage1(getImagePath(petBean.getPet_id()));
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return petBean;
	}
	
	public int updatePet(PetBean petBean)
	{
		int rowAffected = 0;
		PreparedStatement stmt = null;
		boolean flag = false;
		if (conn != null) {
			String updateOra = "update pet_details set pet_name=? , category_id=? , breed_id=? , age=? , gender=? , color=? , status=? , vet_id=? , health_details=? where pet_id=?";
			try {
				
				stmt = conn.prepareStatement(updateOra);
				stmt.setString(1, petBean.getPet_name());
				stmt.setInt(2, petBean.getCatergory_id());
				stmt.setInt(3, petBean.getBreed_id());
				stmt.setInt(4, petBean.getAge());
				stmt.setString(5, petBean.getGender());
				stmt.setString(6, petBean.getColor());
				stmt.setString(7, petBean.getStatus());
				stmt.setInt(8, petBean.getVet_id());
				stmt.setString(9, petBean.getHealth_details());
				stmt.setInt(10, petBean.getPet_id());
							
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
