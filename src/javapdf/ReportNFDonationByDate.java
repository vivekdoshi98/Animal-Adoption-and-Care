package javapdf;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.FinancialDonationBean;
import bean.NonFinancialDonationBean;
import dao.FinancialDonationDao;
import dao.NonFinancialDonationDao;

/**
 * Servlet implementation class ReportNFDonationByDate
 */
public class ReportNFDonationByDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportNFDonationByDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String from= request.getParameter("datepicker1");
		
		
		String to=request.getParameter("datepicker2");

			
		System.out.println(from + " " + to);
		ArrayList<NonFinancialDonationBean> fBean = new NonFinancialDonationDao().getNFDonationReportByDate(from, to);
		File uploads = new File("/TYPROJ/reports");
	 	    if(!uploads.exists()) {
	 	    uploads.mkdir();	
	 	    }
			String fileName = "Financial_Donations_Report_" + System.currentTimeMillis() + ".pdf";
			response.setContentType("application/pdf");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "max-age=0");
			response.setHeader("Content-disposition", "attachment; " + "filename=" + fileName);
			System.out.println("temperotyFilePath : " + uploads);
			try {

				GenerateNFDonationsReport.createNFDonationReport(uploads + "\\" + fileName,fBean);
				
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				baos = convertPDFToByteArrayOutputStream(uploads + "\\" + fileName);
				OutputStream os = response.getOutputStream();
				baos.writeTo(os);
				os.flush();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request, response);
		}

		public static ByteArrayOutputStream convertPDFToByteArrayOutputStream(String fileName) {

			InputStream inputStream = null;
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			try {

				inputStream = new FileInputStream(fileName);

				byte[] buffer = new byte[1024];
				baos = new ByteArrayOutputStream();

				int bytesRead;
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					baos.write(buffer, 0, bytesRead);
				}
				//System.out.println("baos.toString() : "+baos.toString());

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			return baos;
		}

}
