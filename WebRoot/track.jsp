<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="home improvement,repair,fix things,plumbers,electrician,carpenter required">
	<meta http-equiv="description" content="Clikfix">
	
	<title> Clik2Fix | Track Order </title>
	<link rel="icon" type="image/vnd.microsoft.icon" href="http://www.clik2fix.com/images/png-favicon.ico" />
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script  type="text/javascript" src="js/typeahead.min.js"></script>
		
	<link rel="stylesheet" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans">
	
	<script type="text/javascript" src="js/jquery.form.js"></script>
	
<script type="text/javascript">

$(document).ready(function(){	
	$("#terms").click(function(){
		$("#termsModal").modal('show');
	});	
	
	$("#btn_track_order").click(function(e){
		e.preventDefault();
		var vOrderNumber = $("#orderNumber").val();
		if(vOrderNumber.length == 0) {
										$("#preview").html("<div class='alert alert-danger alert-error'>"+
										"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
										"    <strong>Please enter your order number</strong>"+
										"</div>");											
		} else {
			$("#track_order_form").ajaxForm({
				dataType: 'json',
				beforeSend: function(e) { $("#preview").html("<img src='images/ajax_loading.gif'>"); },	
				uploadProgress: function(e) { },
				success:   function(data) {  										  		
					$("#preview").empty();	
					if(data.orderStatusType == 'success') {
										$("#preview").html("<div class='alert alert-success'>"+
										"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
										"    <strong>Your order status: </strong>"+ data.orderStatus +""+
										"</div>");						
					} else {
										$("#preview").html("<div class='alert alert-danger alert-error'>"+
										"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
										"    <strong>"+ data.orderStatus +"</strong>"+
										"</div>");						
					
					}
					//$("#preview").html(data.orderStatus);								
				}	 
			}).submit();
		}		
	});	
	
});
</script>

<style type="text/css">
.map {
	height: 300px;
	width: 960px;  
	background-image: url('images/map.png');
    background-repeat: no-repeat;
}
</style>
</head>
  
<body>


<div id="termsModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 id="t1" class="modal-title">Web Site Terms and Conditions of Use:</h4>
             </div>
            <div id="b1" class="modal-body">            	

<b><u>1. Terms</u></b>
<p>
By accessing this web site, you are agreeing to be bound by these web site Terms and Conditions of Use, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this web site are protected by applicable copyright and trade mark law.
</p>

<b><u>2. Use License</u></b>

<p>
Permission is granted to temporarily download one copy of the materials (information or software) on GVK Priya Solutions's web site for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:
modify or copy the materials;
use the materials for any commercial purpose, or for any public display (commercial or non-commercial);
attempt to decompile or reverse engineer any software contained on GVK Priya Solutions's web site;
remove any copyright or other proprietary notations from the materials; or
transfer the materials to another person or "mirror" the materials on any other server.
This license shall automatically terminate if you violate any of these restrictions and may be terminated by GVK Priya Solutions at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.
</p>

<b><u>3. Disclaimer</u></b>
<p>
The materials on GVK Priya Solutions's web site are provided "as is". GVK Priya Solutions makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Further, GVK Priya Solutions does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its Internet web site or otherwise relating to such materials or on any sites linked to this site.
</p>
<b><u>4. Limitations</u></b>
<p>
In no event shall GVK Priya Solutions or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption,) arising out of the use or inability to use the materials on GVK Priya Solutions's Internet site, even if GVK Priya Solutions or a GVK Priya Solutions authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.
</p>
<b><u>5. Revisions and Errata</u></b>
<p>
The materials appearing on GVK Priya Solutions's web site could include technical, typographical, or photographic errors. GVK Priya Solutions does not warrant that any of the materials on its web site are accurate, complete, or current. GVK Priya Solutions may make changes to the materials contained on its web site at any time without notice. GVK Priya Solutions does not, however, make any commitment to update the materials.
</p>
<b><u>6. Links</u></b>
<p>
GVK Priya Solutions has not reviewed all of the sites linked to its Internet web site and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by GVK Priya Solutions of the site. Use of any such linked web site is at the user's own risk.
</p>
<b><u>7. Site Terms of Use Modifications</u></b>
<p>
GVK Priya Solutions may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use.
</p>
<b><u>8. Governing Law</u></b>
<p>
Any claim relating to GVK Priya Solutions's web site shall be governed by the laws of the State of Telengana without regard to its conflict of law provisions.
</p>
<p>
<b><u>General Terms and Conditions applicable to Use of a Web Site.</u></b>
</p>
<b><u>9. Privacy Policy</u></b>
<p>
Your privacy is very important to us. Accordingly, we have developed this Policy in order for you to understand how we collect, use, communicate and disclose and make use of personal information. The following outlines our privacy policy.
</p>
<p>
Before or at the time of collecting personal information, we will identify the purposes for which information is being collected.
We will collect and use of personal information solely with the objective of fulfilling those purposes specified by us and for other compatible purposes, unless we obtain the consent of the individual concerned or as required by law.
We will only retain personal information as long as necessary for the fulfillment of those purposes.
We will collect personal information by lawful and fair means and, where appropriate, with the knowledge or consent of the individual concerned.
Personal data should be relevant to the purposes for which it is to be used, and, to the extent necessary for those purposes, should be accurate, complete, and up-to-date.
We will protect personal information by reasonable security safeguards against loss or theft, as well as unauthorized access, disclosure, copying, use or modification.
We will make readily available to customers information about our policies and practices relating to the management of personal information.
We are committed to conducting our business in accordance with these principles in order to ensure that the confidentiality of personal information is protected and maintained.
</p>
<b><u>10. Payment and Refunds</u></b>
<p>
All payments should be done through the payment gateway which is maintained by a third party Government of India approved vendor PayU Private Limited.
</p>
<p>
All fees collected for the requirement are inclusive of all taxes.
The amount is non-refundable. However, if there are issues with network or from the gateway, the company will raise a refund request with the vendor which is subject to approval.
</p>
            </div>            
            <div id="f3" class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>               
            </div>                        
        </div>
    </div>
</div>

<div id="menu-desktop" class="menu sec_header" style="position:fixed;">
<nav class="navbar navbar-inverse navbar-fixed-top" style="height:75px; border-radius:0px;"> 
<div class="container-fluid" style="background-color:black; height:100%;">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand logo_menu_align" href="welcome-to-clik2fix-home-improvement-services"><img src="images/logo_home_page_nav.png"/></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
	
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="padding-top:10px; background-color:black;">
	  <ul class="nav navbar-nav navbar-right">
        <li>
			<a href="https://www.facebook.com/clik2fix" target="_blank">
				<img src="images/follow.png"/> &nbsp; <span class="glyphicon glyphicon-thumbs-up"></span>
			</a>
		</li>
      </ul>	
	  <ul class="nav navbar-nav navbar-right">
        <li><a href="about-clik2fix"> <img src="images/about.png"/> <span class="sr-only">(current)</span></a></li>
        <li><a href="track-your-clik2fix-order"><img src="images/track.png"/></a></li>
		<li><a href="services-offered-by-clik2fix"><img src="images/services.png"/></a></li>
		<li><a href="faq-clik2fix"><img src="images/faq.png"/></a></li>
		<li><a href="reach-clik2fix"><img src="images/contact.png"/></a></li>
      </ul>

    </div><!-- /.navbar-collapse -->	
  </div><!-- /.container-fluid -->
</div>  
</nav>
</div>
	
    <div class="container" style="padding-top:50px;">    
    <center>
    <br/><br/>    
    	<h3>Track Order:</h3>
    <br/>
	<div id="preview" style="margin-top:15px; margin-bottom:50px;"> </div>
	
   	
   	<form class="form-inline" id="track_order_form" name="track_order_form" action="track-clik2fix-order" method="post">
   		<div class="form-group">
   			Please enter your order ID:
   		</div>	
   	    <div class="form-group">
   		<span class="bs-example">
   		<input id="orderNumber" name="orderNumber" type="text" class="form-control" placeholder="Order ID"></span>
   		</div>
   		<div class="form-group">
   		<span style="padding-left:10px;">
   		<button id="btn_track_order" name="btn_track_order" class="btn btn-primary">
   			Submit
   		</button>
   		</span>
   		</div>
   	</form>
   	</center>
    <!-- 
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    -->
    </div>
	 
	<jsp:include page="credits.jsp"></jsp:include>	

</body>
</html>


