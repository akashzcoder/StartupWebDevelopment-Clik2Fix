package com.clik2fix.sms;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class SMS {
	
	private static final String SMS_USER_NAME =  "prakashkvs";
	private static final String SMS_PASSWORD =  "1927428825";
	private static final String SENDER_ID = "CLKFIX";

	public static boolean sendSMS(String msg, String mobile) {
		String result = null;
		try {
			String mURL= "http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username="+URLEncoder.encode(SMS_USER_NAME, "UTF-8")+"&password="+URLEncoder.encode(SMS_PASSWORD, "UTF-8")+"&sendername="+URLEncoder.encode(SENDER_ID, "UTF-8")+"&mobileno=91"+URLEncoder.encode(mobile, "UTF-8")+"&message="+URLEncoder.encode(msg, "UTF-8");
			URL url = new URL(mURL);
			URLConnection hpCon = url.openConnection(); 
			BufferedReader reader = new BufferedReader(new InputStreamReader(hpCon.getInputStream())); 
			for (String line; (line = reader.readLine()) != null;) { 
				result = line; 
			}
			System.out.println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}  finally {			 
		}
		return true;
	}

}
