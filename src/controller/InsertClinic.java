package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ClinicBean;
import dao.ClinicDao;

/**
 * Servlet implementation class InsertClinic
 */
public class InsertClinic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertClinic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String clinic_name=request.getParameter("clinic_name");
		String clinic_owner=request.getParameter("clinic_owner");
		String clinic_cl_ad1=request.getParameter("cl_addressline_1");
		String clinic_cl_ad2=request.getParameter("cl_addressline_2");
		int clinic_pin=Integer.parseInt(request.getParameter("cl_pincode"));
		String clinic_con=request.getParameter("cl_contact");
		String clinic_location=request.getParameter("cl_location");
		String clinic_website=request.getParameter("cl_website");
		System.out.println("hao1");
		int clinic_cl_area=Integer.parseInt(request.getParameter("cl_area_id"));
		
		ClinicBean clb=new ClinicBean();
		clb.setArea_id(clinic_cl_area);
		clb.setCl_addressLine1(clinic_cl_ad1);
		clb.setCl_addressLine2(clinic_cl_ad2);
		clb.setCl_pincode(clinic_pin);
		clb.setClinic_name(clinic_name);
		clb.setClinic_owner(clinic_owner);
		clb.setContact(clinic_con);
		clb.setLocation(clinic_location);
		clb.setWebsite(clinic_website);
		
		if (new ClinicDao().insertClinic(clb) > 0 )
	     {
	    	 //request.getSession().setAttribute("userObj",userBean);
	    	//RequestDispatcher rd = request.getRequestDispatcher("admin/RegisterConfirmation.jsp");
	    	//rd.forward(request, response);
	    		response.sendRedirect("admin/clinic_details.jsp");	
	     }
		System.out.println("hao");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
