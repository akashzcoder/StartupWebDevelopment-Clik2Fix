package com.clik2fix.util;

public class EmailTemplate {
	public static String NEW_ENQUIRY = "You have a new enquiry from: VAR_1, <br><br>Message: VAR_2.";
	
	public static String EMAIL_NEW_ORDER = "<html>"+
	"<head>"+
	"	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>"+
	"	<style type='text/css'>"+
	"	body {"+
	"		font-family: 'Open Sans';"+
	"		font-size:14px;"+
	"	}"+
	"	</style>"+
	"</head>"+
	"<body>"+
	"	<div style='margin:15px;'>"+
	"		<br/>"+
	"		Dear VAR_1, <br><br>		"+
	"		Thank you for your order.<br><br> "+
	"		Your Order ID(One Time Password) is: <b>VAR_2</b> "+
	"		<br/><br>"+
	"		If you have any queries, please contact us at <b>support@clik2fix.com</b>"+
	"		<br/><br/>"+
	"	<div style='margin-top:15px;'>"+	
	"		Regards,<br/>"+	
	"		Team Clik2Fix."+
	"	</div>"+
	"	</div>"+
	"</body>"+
	"</html>";									 
	
}
