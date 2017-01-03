package com.clik2fix.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.SendFailedException;

import com.clikfix.exceptions.GlobalException;

public class EMailUtil {
	private static String from;
	private static String password;
		
	static Properties properties = new Properties();
			
	public static boolean sendMail(String to, String subject, String body) throws GlobalException {		
		boolean flag = false;
		
		try
		{
			//properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.host", "smtp.clik2fix.com");			
			//properties.put("mail.smtp.socketFactory.port", "465");
			//properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
						
			from = "support@clik2fix.com";
			password = "7college@";
			
			Session session = Session.getDefaultInstance(properties,  
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(from, password);
						}
					});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			//message.setText(body);		
			message.setContent(body, "text/html");
			Transport.send(message);
			
			flag = true;
			
		} catch(SendFailedException e) {
			flag = false;
		} catch(Exception e) {			
			e.printStackTrace();
			throw new GlobalException(e.getMessage());
			
		}
		return flag;
	}
	
/*	public static void main(String args[]) {
		try {
			EMailUtil.sendMail("chaitanya1006@gmail.com", "Hi", "Test Mail");
		} catch (GlobalException e) {
			e.printStackTrace();
		}
	}
*/
}
