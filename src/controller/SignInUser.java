package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

/**
 * Servlet implementation class SignInUser
 */
public class SignInUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			String email= request.getParameter("email");
			String pass = request.getParameter("password");
			HttpSession session = request.getSession();
			
			
			UserDao userDao = new UserDao();
			
			if(userDao.areCredentialsValid(email, pass)) {
				
				session.setAttribute("isLoggedIn", email);
				int type_id= userDao.getTypeId(email);
				int id = userDao.getUserId(email);
				if (type_id==1)
				{
					session.setAttribute("id", id);
					response.sendRedirect("admin/main-page.jsp");
				
				}
				else if(type_id==2){
					session.setAttribute("id", id);
					response.sendRedirect("vet/main-page.jsp");
				}
				else
				{
			
			
			//request.setAttribute("name", email);
			//System.out.println("HEYEYYEYEYEYEYEY");
					session.setAttribute("id", id);
					response.sendRedirect("user/index.jsp");
				}
		}
	
		else
		{
			response.sendRedirect("user/index.jsp?err='Invalid credentials'");
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
