package EmailVerif;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Comparator;
import java.util.Optional;
import java.util.Properties;
import java.util.stream.Stream;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import util.GetDate;
//import javax.servlet.http.HttpServlet;


//import com.util.FileHandle;

public class SendAttachmentInEmail
{
   /**
	 * 
	

//public static void main(String[] args) {
		//Path dir = Paths.get("C:\\Users\\Vruttant\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\work\\Catalina\\localhost\\jspexamples");
		/*try {
			Optional<Path> lastFilePath = Files.list(dir).filter(f-> !Files.isDirectory(f)).max(Comparator.comparingLong(f -> f.toFile().lastModified()));
			if(lastFilePath.isPresent())
			{
				System.out.println(lastFilePath);
			}
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		*/
	public static void sendConfirmEmail(String to) {
	//File filePath = FileHandle.lastFileModified("C:\\Users\\Vruttant\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\work\\Catalina\\localhost\\jspexamples");
	//System.out.println(filePath.getAbsolutePath());
	//String filename = filePath.getAbsolutePath();
	
		// Recipient's email ID needs to be mentioned.
     // String to = "vruttant@hotmail.com";
	//System.out.println(to);
      // Sender's email ID needs to be mentioned
      String from = "vamankad@gmail.com";

      final String username = "vamankad";//change accordingly
      final String password = "mankad####";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      String host = "smtp.gmail.com";

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "25");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
    	  protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(username, password);
           }
        });

     try {
        // Create a default MimeMessage object.
        Message message = new MimeMessage(session);

        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.
        message.setRecipients(Message.RecipientType.TO,
           InternetAddress.parse(to));

        // Set Subject: header field
        message.setSubject("Confirm Email");

        // Create the message part
        BodyPart messageBodyPart = new MimeBodyPart();

        // Now set the actual message
        messageBodyPart.setText("Please Confirm Your email by clicking the link below.\n"
        		+ " http://localhost:8081/AAC/TestEmail?id=12345 \n"
        		+ "Regards -A.A.C");

        // Create a multipar message
        Multipart multipart = new MimeMultipart();

        // Set text message part
        multipart.addBodyPart(messageBodyPart);

        // Part two is attachment
        messageBodyPart = new MimeBodyPart();
       // String filename = "C:\\Users\\Vruttant\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\work\\Catalina\\localhost\\jspexamples\\Generate_Report_1518666053828.pdf";
       /* DataSource source = new FileDataSource(filename);
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(filename);
        multipart.addBodyPart(messageBodyPart);*/

        // Send the complete message parts
        message.setContent(multipart);

        // Send message
        Transport.send(message);

        System.out.println("Sent message successfully....");
 
     } catch (MessagingException e) {
        throw new RuntimeException(e);
     }
  }
	
	////////////// ----------- FORGOT PASS EMAIL -----------------------
	
	public static void sendPasswordEmail(String to,int id) {
		
	      // Sender's email ID needs to be mentioned
	      String from = "vamankad@gmail.com";

	      final String username = "vamankad";//change accordingly
	      final String password = "mankad####";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "25");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	         new javax.mail.Authenticator() {
	    	  protected PasswordAuthentication getPasswordAuthentication() {
	              return new PasswordAuthentication(username, password);
	           }
	        });

	     try {
	        // Create a default MimeMessage object.
	        Message message = new MimeMessage(session);

	        // Set From: header field of the header.
	        message.setFrom(new InternetAddress(from));

	        // Set To: header field of the header.
	        message.setRecipients(Message.RecipientType.TO,
	           InternetAddress.parse(to));

	        // Set Subject: header field
	        message.setSubject("RESET PASSWORD A.A.C");

	        // Create the message part
	        BodyPart messageBodyPart = new MimeBodyPart();

	        // Now set the actual message
	        messageBodyPart.setText("Your new Password is as below. Please Change it ASAP as per your desire.\n"
	        		+ id + (id/2) + new GetDate().getTodayDate()+"\n"
	        		+ "Regards -A.A.C");

	        // Create a multipar message
	        Multipart multipart = new MimeMultipart();

	        // Set text message part
	        multipart.addBodyPart(messageBodyPart);

	        // Part two is attachment
	        messageBodyPart = new MimeBodyPart();
	       // String filename = "C:\\Users\\Vruttant\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\work\\Catalina\\localhost\\jspexamples\\Generate_Report_1518666053828.pdf";
	       /* DataSource source = new FileDataSource(filename);
	        messageBodyPart.setDataHandler(new DataHandler(source));
	        messageBodyPart.setFileName(filename);
	        multipart.addBodyPart(messageBodyPart);*/

	        // Send the complete message parts
	        message.setContent(multipart);

	        // Send message
	        Transport.send(message);

	        System.out.println("Sent message successfully....");
	 
	     } catch (MessagingException e) {
	        throw new RuntimeException(e);
	     }
	  }
	
	
	
}
      
