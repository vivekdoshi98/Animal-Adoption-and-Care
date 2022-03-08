package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import bean.AdmissionBean;
import bean.PetBean;
import dao.AdmissionDao;
import dao.CategoryDao;
import dao.PetDao;
import dao.UserDao;

/**
 * Servlet implementation class AdmitPetServlet
 */
@MultipartConfig
public class AdmitPetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmitPetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PetBean petBean = new PetBean();
		petBean.setPet_id((new PetDao().getMaxPetId()) + 1);
		petBean.setPet_name(request.getParameter("pet_name"));
		petBean.setCatergory_id(Integer.parseInt(request.getParameter("pet_category")));
		if (request.getParameter("pet_breed") != null)
		{
			petBean.setBreed_id(Integer.parseInt(request.getParameter("pet_breed")));
		}
		petBean.setAge(Integer.parseInt(request.getParameter("age")));
		petBean.setColor(request.getParameter("color"));
		petBean.setGender(request.getParameter("gender"));
		
		
		
		Part filePart = request.getPart("pet_image");
String filename = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
		
		HttpSession session = request.getSession(false);
		//System.out.println("name "+ filename);
		//System.out.println("pathfull ");
	    InputStream fileContent = filePart.getInputStream();
	    File uploads = new File("/TYPROJ/images/1");
	    if(!uploads.exists()) {
	    uploads.mkdir();	
	    }
	    
	    File file = new File(uploads, filename);
	    //File filePath = uploads;
	   // File filePath = FileHandle.lastFileModified("C:\\Users\\Vruttant\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\work\\Catalina\\localhost\\jspexamples");
	    Files.copy(fileContent ,file.toPath(),StandardCopyOption.REPLACE_EXISTING);
	    System.out.println("File uploaded " + file);
	    petBean.setImage1(file.toString());
	    
	    if (new PetDao().insertAdmissionpet(petBean))
	    {
	    	AdmissionBean admitBean = new AdmissionBean();
	    	
	    	admitBean.setAdmission_id((new AdmissionDao().getMaxAdmissionId()) + 1);
	    	int u_id = (Integer) (session.getAttribute("id"));
	    	admitBean.setUser_id(u_id);
	    	admitBean.setPet_id(petBean.getPet_id());
	    	System.out.println(request.getParameter("appointment_time"));
	    	admitBean.setAppointment_time(request.getParameter("admission_date") + " " + request.getParameter("appointment_time"));
	    	
	    	if (new AdmissionDao().insertAdmission(admitBean) > 0)
	    	{
	    		session.setAttribute("userName", new UserDao().getUserName(u_id));
	    		session.setAttribute("petName", petBean.getPet_name());
	    		session.setAttribute("petBreed", petBean.getBreed_name());
	    		session.setAttribute("petCategory", new CategoryDao().getCategoryName(petBean.getCatergory_id()));
	    		session.setAttribute("appointment", admitBean.getAppointment_time());
	    		System.out.println(session.getAttribute("appointment"));
	    		response.sendRedirect("user/admission_confirmation.jsp");
	    		//System.out.println("yay");
	    	}
	    	
	    }
	    
	}

}
