package com.emergency.fine;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.emergency.model.emergency_model;

public class JavaMailUtil {
	public static void sendMail(emergency_model p) throws AddressException, MessagingException
	{
		 Properties properties =new Properties();
		   properties.put("mail.smtp.auth","true");
		   properties.put("mail.smtp.starttls.enable","true");
		   properties.put("mail.smtp.host","smtp.gmail.com");
		   properties.put("mail.smtp.port","587");
		   String myemail="unny0028@gmail.com";
		   String password="sravank1947";
		   Session session =Session.getInstance(properties, new Authenticator() {
			   protected javax.mail.PasswordAuthentication getPasswordAuthentication()
			   {
				return new javax.mail.PasswordAuthentication(myemail, password);
			   }
		});
		MimeMessage message = PrepareMessage(session,myemail,p);
		Transport.send((javax.mail.Message) message);
		 
		
	}

	private static MimeMessage PrepareMessage(Session session, String myemail, emergency_model p) throws AddressException, MessagingException {
		// TODO Auto-generated method stub
		String location= p.getLocation();
		String affected=p.getAffected();
		String phone =p.getPhone_no();
		String type=p.getVoilationtype();
		MimeMessage message =new MimeMessage(session);
	    (message).setFrom(new InternetAddress(myemail));
	    if(location.equals("kukatpally"))
	    { 
	          message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("unny028@gmail.com"));
	    }
	    else
	    if(location.equals("hitechcity"))
	    {
	    	message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("sravansurendren@gmail.com"));
	    }
	    else
	    if(location.equals("gachiboli"))
	    {
	    	message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress("sravan.nair028@gmail.com"));
	    }
	    message.setSubject("Traffic Emergency");
		message.setText("Location :"+location+"\n"+ "voilation type :"+type +"\n"+"affected people  :"+affected+"\n"+ "phone :"+phone +"\n"+ "Issued by government");			
		
		return(message);
	}
}
