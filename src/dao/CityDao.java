package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.CityBean;
import bean.UserBean;
import util.DBConnection;

public class CityDao {
	Connection conn = DBConnection.getConnection();
	public ArrayList<CityBean> getCities(){
		Statement stmt = null;
		ResultSet rs = null;
		CityBean cityBean=null;
		ArrayList<CityBean> cityList = new ArrayList<CityBean>();
		if (conn != null) {
			String selectOra = "select * from city_details";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					cityBean= new CityBean();
					cityBean.setCity_id(rs.getInt(1));
					cityBean.setCity_Name(rs.getString(2));
					cityList.add(cityBean);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

	
		
		
	}
		return cityList;
	
	
}
}
