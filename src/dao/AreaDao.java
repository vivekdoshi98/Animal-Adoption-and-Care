package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.AreaBean;
import bean.CityBean;
import util.DBConnection;

public class AreaDao {
	Connection conn = DBConnection.getConnection();
	public ArrayList<AreaBean> getArea(int cityid)
	{
		Statement stmt = null;
		ResultSet rs = null;
		AreaBean areaBean = null;
		ArrayList<AreaBean> areaList = new ArrayList<AreaBean>();
		if (conn != null) {
			String selectOra = "select * from area_details where city_id=" + cityid;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					areaBean= new AreaBean();
					areaBean.setArea_id(rs.getInt(1));
					areaBean.setArea_Name(rs.getString(2));
					areaBean.setCity_id(rs.getInt(3));
					areaList.add(areaBean);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

		
		
	}
		return areaList;
	}
	
	public ArrayList<AreaBean> getAllArea()
	{
		Statement stmt = null;
		ResultSet rs = null;
		AreaBean areaBean = null;
		ArrayList<AreaBean> areaList = new ArrayList<AreaBean>();
		if (conn != null) {
			String selectOra = "select * from area_details";
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectOra);
				while (rs.next()) {
					areaBean= new AreaBean();
					areaBean.setArea_id(rs.getInt(1));
					areaBean.setArea_Name(rs.getString(2));
					areaBean.setCity_id(rs.getInt(3));
					areaList.add(areaBean);
				}
			} catch (SQLException e) {
				e.getStackTrace();
			}

		
		
	}
		return areaList;
	}
}
