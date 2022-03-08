package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AreaBean;
import bean.BreedBean;
import bean.CityBean;
import bean.PetCategory_Bean;
import dao.AreaDao;
import dao.BreedDao;
import dao.CategoryDao;
import dao.CityDao;

/**
 * Servlet implementation class AjaxCategory
 */
public class AjaxCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		ArrayList<PetCategory_Bean> categories = new CategoryDao().getCategories();
		
		int c_id = Integer.parseInt(request.getParameter("category"));
		ArrayList<BreedBean> breeds = new BreedDao().getBreeds(c_id);
		
		
		//System.out.println("heyyyyyyy");
		for (int i =0; i<breeds.size();i++)
		{
			out.write(breeds.get(i).getBreed_id() + "," + breeds.get(i).getBreed_name() + ":");
		//	System.out.println(areaList.get(i).getArea_id() + "," + areaList.get(i).getArea_Name() + " ");
		}
		out.close();

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
