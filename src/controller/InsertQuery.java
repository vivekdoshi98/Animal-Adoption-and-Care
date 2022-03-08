package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.QueryBean;
import dao.QueryDao;
import dao.UserDao;
import util.GetDate;

/**
 * Servlet implementation class InsertQuery
 */
public class InsertQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Calendar calendar = Calendar.getInstance();
		String date = new GetDate().getTodayDate();
		
		UserDao userDao = new UserDao();
		QueryDao queryDao = new QueryDao();
		HttpSession session = request.getSession(false);
		int query_id = 1;
		int user_id=1;
		query_id += queryDao.getMaxQueryId();
		//user_id += userDao.getMaxUserId();
		
		QueryBean qBean = new QueryBean();
		qBean.setQuery_id(query_id);
		int id = (Integer)session.getAttribute("id");
		qBean.setUser_id(id);
		qBean.setUser_name(new UserDao().getUserName(id));
		qBean.setQuery_text(request.getParameter("query_text"));
		qBean.setQuery_type(request.getParameter("query_type"));
		//System.out.println(qBean.getQuery_type());
		qBean.setQuery_sub_date(date);
		
		if(queryDao.insertQuery(qBean))
		{
			
			//RequestDispatcher rd = request.getRequestDispatcher("user/QueryConfirmation.jsp");
			session.setAttribute("queryBean", qBean);
			
			response.sendRedirect("user/QueryConfirmation.jsp?");
			
			
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
