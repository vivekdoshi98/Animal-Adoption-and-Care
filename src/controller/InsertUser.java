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
public class InsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String first_Name = request.getParameter("first_Name");
		String last_Name= request.getParameter("last_Name");
		String contact = request.getParameter("contact");
		String password= request.getParameter("password");
		String email = request.getParameter("reg_email");
		String dob = request.getParameter("dob");
	    String gender = request.getParameter("gender");
		String user_type_id = request.getParameter("user_type_id");
		 UserBean userBean = new UserBean();
		 userBean.setUser_type_id(user_type_id);
		 userBean.setEmail(email);
	     userBean.setFirst_Name(first_Name);
	     userBean.setGender(gender);
	     userBean.setLast_Name(last_Name);
	     userBean.setContact(contact);
	     userBean.setDob(dob); 
	    // userBean.setPan_number(pan_number);
	     userBean.setPassword(password);
	     
	     if(new UserDao().insertNewUser(userBean) > 0)
	     {
	    	 RequestDispatcher rd = request.getRequestDispatcher("SendEmailServlet?id="+userBean.getEmail());
	    	 //request.setAttribute("id", userBean.getEmail());
	    	 rd.include(request, response);
	    	 
	    	 response.sendRedirect("checkEmail.jsp");
	     }
		 
	}

}
