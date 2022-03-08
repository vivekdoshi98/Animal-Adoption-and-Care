package javapdf;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import bean.AdoptionBean;
import bean.PetBean;
import dao.PetDao;
import dao.UserDao;

public class GenerateAdoptionPDF {
	private static Font HELVETICA = new Font(Font.FontFamily.HELVETICA, 18,Font.BOLD);
	private static com.itextpdf.text.Font TIME_NEW_ROMAN = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

	public static void createAdoptionByCategoryPDF(String file,ArrayList<AdoptionBean> adopBean)
	{
		Document document = null;

		try {
			document = new Document();
			FileOutputStream f = new FileOutputStream(file);
			PdfWriter writer = PdfWriter.getInstance(document, f);
			/*String USER_PASS = "Hello123";
			
			String OWNER_PASS = "Owner123";*/

			

			/*writer.setEncryption(USER_PASS.getBytes(), OWNER_PASS.getBytes(), PdfWriter.ALLOW_PRINTING,
					PdfWriter.ENCRYPTION_AES_128);*/

			document.open();
			

			addMetaData(document);

			addTitlePage(document);

			createAdoptionTable(document,adopBean);

			document.close();

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		//return document;

	}
	
	private static void createAdoptionTable(Document document,ArrayList<AdoptionBean> adopList) throws DocumentException {
		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(6);


		PdfPCell c1 = new PdfPCell(new Phrase("Pet"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Category"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Breed"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
			
		c1 = new PdfPCell(new Phrase("Adopted BY"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Adoption Date"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Pet Image"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		
		
		table.setHeaderRows(1);
		//ArrayList<EmpBean> listOfEmp = EmpDao.getAllEmps();
		for (int i = 0; i < adopList.size(); i++) {
			AdoptionBean adopBean = adopList.get(i);
			table.setWidthPercentage(100);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			table.addCell(adopBean.getPet_name());
			table.addCell(adopBean.getPet_category());
			table.addCell(adopBean.getPet_breed());
			table.addCell(adopBean.getUser_name());
			table.addCell((adopBean.getAdoption_date()).substring(0, 11));
			
			
			try {
				Image petimg = Image.getInstance("E:\\TY PROJ\\Template\\AAC\\WebContent\\images\\" +new PetDao().getImagePath(adopBean.getPet_id()));
				table.addCell(petimg);
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		document.add(table);
	}

	
	private static void addMetaData(Document document) {
		document.addTitle("A.A.C REPORT");
		document.addSubject("Animal Adoptions REPORT");
		document.addAuthor("AAC");
		document.addCreator("AAC");
	}

	private static void addTitlePage(Document document)
			throws DocumentException {

		Paragraph preface = new Paragraph("A.A.C", HELVETICA);
		//preface.setAlignment(Image.ALIGN_CENTER);
		creteEmptyLine(preface, 2);
		creteEmptyLine(preface, 1);
		preface.add(new Paragraph("Animal Adoptions Report", HELVETICA));

		creteEmptyLine(preface, 1);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MMM/yyyy");
		preface.add(new Paragraph("Report created on "
				+ simpleDateFormat.format(new Date()) , TIME_NEW_ROMAN));
		
		creteEmptyLine(preface, 1);
		try {
			Image img1 = Image.getInstance("E:\\TY PROJ\\Template\\AAC\\WebContent\\images\\aac_logo_t1.jpg");
			img1.scaleAbsolute(200, 200);
			img1.setAlignment(Image.ALIGN_CENTER);
			document.add(img1);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		document.add(preface);

	}
	
	private static void creteEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}
	
	
	
}
