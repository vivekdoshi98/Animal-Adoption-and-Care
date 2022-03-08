package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Feedback;
import dao.AnimalDao;
import dao.FeedbackDao;
import util.GetDate;

/**
 * Servlet implementation class InsertFeedback
 */
public class InsertFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String feedback = request.getParameter("feedback_text").trim();
		Feedback fBean = new Feedback();
		fBean.setFeedback_text(feedback);
		HttpSession session = request.getSession(false);
		int id = (Integer)session.getAttribute("id");
		
		fBean.setUser_id(id);
		fBean.setFeedback_date(new GetDate().getTodayDate());
		fBean.setFeedback_id((new FeedbackDao().getMaxFeedbackId()) + 1);
		
		if (new FeedbackDao().insertFeedback(fBean) > 0)
		{
			System.out.println(" yayyyyyyy ");
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




