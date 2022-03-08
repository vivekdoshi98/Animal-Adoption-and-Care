package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import bean.PetCategory_Bean;
import util.DBConnection;

public class CategoryDao {
	Connection conn = DBConnection.getConnection();
	
	public String getCategoryName(int id)
	{
		String str ="";
		Statement stmt = null;
		ResultSet rs = null;
		if (conn!=null)
		{
			String sql = "select category_name from pet_categories where category_id=" + id;
			try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					str=rs.getString(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return str;
	}
	
	
	
	public ArrayList<PetCategory_Bean> getCategories(){
		Statement stmt = null;
		ResultSet rs = null;
		PetCategory_Bean category=null;
		ArrayList<PetCategory_Bean> categories = new ArrayList<PetCategory_Bean>();
		if (conn != null) {
			String selectOra = "select * from pet_categories";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					category= new PetCategory_Bean();
					category.setCategory_id(rs.getInt(1));
					category.setCategory_name(rs.getString(2));
					categories.add(category);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

	
		
		
	}
		return categories;
	
	
}
}



