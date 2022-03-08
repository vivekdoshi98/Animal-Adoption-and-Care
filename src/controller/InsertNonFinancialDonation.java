package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.FinancialDonationBean;
import bean.NonFinancialDonationBean;
import dao.FinancialDonationDao;
import dao.NonFinancialDonationDao;
import dao.UserDao;
import util.GetDate;

/**
 * Servlet implementation class InsertNonFinancialDonation
 */
public class InsertNonFinancialDonation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNonFinancialDonation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String date = new GetDate().getTodayDate();
		
		UserDao userDao = new UserDao();
		NonFinancialDonationDao finDao = new NonFinancialDonationDao();
		HttpSession session = request.getSession(false);
		int fin_id = 1;
		int user_id=1;
		fin_id += finDao.getMaxDonationId();
		//user_id += userDao.getMaxUserId();
		
		NonFinancialDonationBean fBean = new NonFinancialDonationBean();
		fBean.setNon_financial_donation_id(fin_id);
		int id = (Integer)session.getAttribute("id");
		fBean.setUser_id(id);
		fBean.setFirst_name(userDao.getUserName(id));
		fBean.setDonation_desc(request.getParameter("donation_description"));
		
		
		//System.out.println(qBean.getQuery_type());
		fBean.setAppointment_time(request.getParameter("appointment_date") + " " + request.getParameter("appointment_time"));
		
		if(finDao.insertDonation(fBean))
		{
			
			//RequestDispatcher rd = request.getRequestDispatcher("user/QueryConfirmation.jsp");
			session.setAttribute("nonfinBean", fBean);
			
			response.sendRedirect("user/nonfin_donation_confirmation.jsp");
			
			
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
