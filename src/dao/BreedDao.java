package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.BreedBean;
import bean.PetCategory_Bean;
import util.DBConnection;

public class BreedDao {
	Connection conn = DBConnection.getConnection();
	public ArrayList<BreedBean> getBreeds(int c_id)
	{
		ResultSet rs = null;
		Statement stmt =null;
		BreedBean breed = null;
		ArrayList<BreedBean> breeds = new ArrayList<BreedBean>();
		if (conn != null)
		{
			String selectOra = "select * from pet_breeds where category_id=" + c_id;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					breed= new BreedBean();
					breed.setBreed_id(rs.getInt(1));
					breed.setBreed_name(rs.getString(2));
					breed.setCategory_id(rs.getInt(3));
					breed.setBreed_Description(rs.getString(4));
					breeds.add(breed);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}
		}
		return breeds;
	}

}
