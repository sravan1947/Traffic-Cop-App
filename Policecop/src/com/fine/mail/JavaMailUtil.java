package com.fine.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.fine.datamodel.finemodel;
import com.mysql.cj.protocol.Message;

public class JavaMailUtil {
	public static void sendMail(String recepient,finemodel p) throws AddressException, MessagingException
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
	   MimeMessage message = PrepareMessage(session,myemail,recepient,p); 
	 Transport.send((javax.mail.Message) message);
	 System.out.println("sent message successfully");
	 
	 
	}

	private static MimeMessage PrepareMessage(Session session, String email, String receipient,finemodel p) throws AddressException, MessagingException {
		 String fine =p.getFine_amount();
		 String voilation_type=p.getVoilation_type();
		 String vehicle=p.getVechicle_number();
		 String location=p.getLocation();
		 String date=p.getData_and_time();
		 MimeMessage message =new MimeMessage(session);
		(message).setFrom(new InternetAddress(email));
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receipient));
		message.setSubject("Traffic fine detials");
		message.setText("Vehicle No. :"+vehicle+"\n"+ "Voilation type :"+voilation_type +"\n"+"Location  :"+location+"\n"+ "fine :"+fine +"\n"+date+"\n"+ "Issued by government");
			return  message;
	}
}
