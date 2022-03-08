package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AdoptionBean;
import bean.PetBean;
import bean.UserBean;
import dao.AdoptionDao;
import dao.UserDao;

/**
 * Servlet implementation class InsertAdoption
 */
public class InsertAdoption extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdoption() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		if ( session != null)
		{
			PetBean petBean = new PetBean();
			AdoptionBean adopBean = new AdoptionBean();
			int id = (Integer) session.getAttribute("id");
			UserBean userBean = new UserBean();
			userBean.setUser_id(id);
			userBean.setAddress_Line1(request.getParameter("address_Line1"));
			userBean.setAddress_Line2(request.getParameter("address_Line2"));
			userBean.setArea_id(Integer.parseInt(request.getParameter("area_id")));
			userBean.setPincode(Integer.parseInt(request.getParameter("pincode")));
			userBean.setPan_number(request.getParameter("pan_number"));
			
			int pet_id = Integer.parseInt(request.getParameter("selectedPetId").trim());
			UserDao userDao = new UserDao();
			AdoptionDao adopDao = new AdoptionDao();
			if (userDao.insertPersonalDetails(userBean) > 0)
			{
				adopBean.setAdoption_date(request.getParameter("adoption_date"));
				System.out.println(adopBean.getAdoption_date());
				
				adopBean.setAppointment_time(request.getParameter("appointment_time").trim());
				System.out.println(adopBean.getAppointment_time());
				adopBean.setUser_id(id);
				adopBean.setPet_id(pet_id);
				adopBean.setAdoption_id(adopDao.getMaxAdoptionId() + 1);
				
				if (adopDao.insertAdoption(adopBean) > 0)
				{
					response.sendRedirect("user/adoption_confirmation.jsp?id="+adopBean.getAdoption_id());
				}
			}
			
			
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
