package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.PetBean;
import dao.PetDao;

/**
 * Servlet implementation class UpdatePet
 */
public class UpdatePet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PetBean petBean=new PetBean();
		petBean.setAge(Integer.parseInt(request.getParameter("age")));
		petBean.setBreed_id(Integer.parseInt(request.getParameter("pet_breed")));
		petBean.setCatergory_id(Integer.parseInt(request.getParameter("pet_category")));
		petBean.setColor(request.getParameter("color"));
		petBean.setGender(request.getParameter("gender"));
		petBean.setHealth_details(request.getParameter("health_details"));
		petBean.setImage1(request.getParameter("image_path"));
		petBean.setPet_id(Integer.parseInt(request.getParameter("pet_id")));
		petBean.setPet_name(request.getParameter("pet_name"));
		petBean.setStatus(request.getParameter("status"));
		petBean.setVet_id(Integer.parseInt(request.getParameter("vet_id")));
		if (new PetDao().updatePet(petBean)> 0 )
	     {
	    	 //request.getSession().setAttribute("userObj",userBean);
	    	//RequestDispatcher rd = request.getRequestDispatcher("admin/RegisterConfirmation.jsp");
	    	//rd.forward(request, response);
	    		response.sendRedirect("admin/show_pets.jsp");	
	     }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
