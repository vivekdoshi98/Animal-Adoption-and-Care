package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AreaBean;
import bean.CityBean;
import dao.AreaDao;
import dao.CityDao;

/**
 * Servlet implementation class AjaxState
 */
//@WebServlet(asyncSupported = true, urlPatterns = { "/AjaxState" })
public class AjaxState extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxState() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/plain");
			PrintWriter out = response.getWriter();
			ArrayList<CityBean> cityList = new CityDao().getCities();
			
			int city_id = Integer.parseInt(request.getParameter("city"));
			ArrayList<AreaBean> areaList = new AreaDao().getArea(city_id);
			
			
			//System.out.println("heyyyyyyy");
			for (int i =0; i<areaList.size();i++)
			{
				out.write(areaList.get(i).getArea_id() + "," + areaList.get(i).getArea_Name() + ":");
			//	System.out.println(areaList.get(i).getArea_id() + "," + areaList.get(i).getArea_Name() + " ");
			}
			out.close();
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

