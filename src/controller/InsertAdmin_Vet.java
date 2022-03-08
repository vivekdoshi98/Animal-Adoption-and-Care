package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;
import dao.UserDao;

/**
 * Servlet implementation class InsertUser
 */
public class InsertAdmin_Vet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdmin_Vet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String first_Name = request.getParameter("first_Name");
		String last_Name= request.getParameter("last_Name");
		String contact = request.getParameter("contact");
		String password= request.getParameter("password");
		String email = request.getParameter("email");
	    String dob = request.getParameter("dob");
	    String gender = request.getParameter("gender");
	    String address_Line1 = request.getParameter("address_line_1");
	    String address_Line2 = request.getParameter("address_line_2");
	     String pan_number= request.getParameter("pan_Number");
	     int area_id = Integer.parseInt(request.getParameter("area_id"));
	     int pincode = Integer.parseInt(request.getParameter("pincode"));
	     String user_type_id = request.getParameter("user_type_id");
	     
	     UserBean userBean = new UserBean();
	     userBean.setAddress_Line1(address_Line1);
	     userBean.setAddress_Line2(address_Line2);
	     userBean.setArea_id(area_id);
	     userBean.setContact(contact);
	     userBean.setDob(dob);
	     userBean.setEmail(email);
	     userBean.setFirst_Name(first_Name);
	     userBean.setGender(gender);
	     userBean.setLast_Name(last_Name);
	     
	     userBean.setPan_number(pan_number);
	     userBean.setPassword(password);
	     userBean.setPincode(pincode);
	     userBean.setUser_type_id(user_type_id);
	     
	     if (new UserDao().insertUser(userBean) > 0 )
	     {
	    	 request.getSession().setAttribute("userObj",userBean);
	    	//RequestDispatcher rd = request.getRequestDispatcher("admin/RegisterConfirmation.jsp");
	    	//rd.forward(request, response);
	    		response.sendRedirect("admin/RegisterConfirmation.jsp");	
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
