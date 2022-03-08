package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.FinancialDonationBean;
import bean.QueryBean;
import dao.FinancialDonationDao;
import dao.QueryDao;
import dao.UserDao;
import util.GetDate;

/**
 * Servlet implementation class InsertFinancialDonation
 */
public class InsertFinancialDonation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFinancialDonation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
String date = new GetDate().getTodayDate();
		
		UserDao userDao = new UserDao();
		FinancialDonationDao finDao = new FinancialDonationDao();
		HttpSession session = request.getSession(false);
		int fin_id = 1;
		int user_id=1;
		fin_id += finDao.getMaxDonationId();
		//user_id += userDao.getMaxUserId();
		
		FinancialDonationBean fBean = new FinancialDonationBean();
		fBean.setFinancial_donation_id(fin_id);
		int id = (Integer)session.getAttribute("id");
		fBean.setUser_id(id);
		fBean.setFirst_name(userDao.getUserName(id));
		fBean.setPayment_amount(Double.parseDouble(request.getParameter("payment_amount")));
		fBean.setPayment_reference_number(request.getParameter("razorpay_payment_id"));
		
		//System.out.println(qBean.getQuery_type());
		fBean.setPayment_date(date);
		
		if(finDao.insertDonation(fBean))
		{
			
			//RequestDispatcher rd = request.getRequestDispatcher("user/QueryConfirmation.jsp");
			session.setAttribute("finBean", fBean);
			
			response.sendRedirect("user/fin_donation_Confirmation.jsp");
			
			
			//	response.sendRedirect("");
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
