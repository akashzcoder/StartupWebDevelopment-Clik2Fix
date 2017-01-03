	<%@taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	
	<title> Clik2Fix </title>
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
	
	$("#btn_place_order").click(function(e){
		e.preventDefault();
		
		var vCustName = $("#custName").val();
		var vEmail = $("#email").val();
		var vMobile = $("#mobile").val();
		var vAddress = $("#address").val();
		var vWorkTypeId = $("#workTypeId").val();
		var vAreaId = $("#areaId").val();		
		
		if(vCustName.length == 0 || vEmail.length == 0 || vMobile.length == 0 || vAddress.length == 0 || vWorkTypeId == 0 || vAreaId == 0) {
				$("#preview").html("<div class='alert alert-danger alert-error'>"+
									"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
									"    <strong>Please fill up all the fields.</strong>"+
									"</div>");											
		} else if(vMobile.length < 10 || vMobile.length > 10) {
				$("#preview").html("<div class='alert alert-danger alert-error'>"+
									"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
									"    <strong>Invalid mobile number</strong>"+
									"</div>");
										
				$("#mobile").css({
					"border-color":"red"
				});			 	
				$("#mobile").focus();
		} else if(!validateEmail(vEmail)) {
				$("#preview").html("<div class='alert alert-danger alert-error'>"+
									"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
									"    <strong> Please provide a valid email </strong>"+
									"</div>");	
				$("#email").css({
					"border-color":"red"
				});			 	
				$("#email").focus();					
		} else {
			$("#orderForm").ajaxForm({
				dataType: 'json',
				beforeSend: function(e) { 
					$("#preview").html("<img src='images/ajax_loading.gif'><br>Processing");
					$("#btn_place_order").attr("disabled","disabled"); 
				},	
				uploadProgress: function(e) { },
				success:   function(data) {
					$("#order_div").hide();  										  		
					$("#preview").empty();					
					if(data.otp != 0) {																
						$("#custName").val("");
						$("#email").val("");
						$("#mobile").val("");
						$("#address").val("");
						
						$("#verifyOtpForm").show();
					}
				}	 
			}).submit();
		}
	});	
	
	$("#btnVerifyOTP").click(function(e){
		e.preventDefault();
		
		var vOtp = $("#otp").val();
		if(isNaN(vOtp)) {
			$("#preview").html("<div class='alert alert-danger alert-error'>"+
					"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
					"    <strong> Invalid OTP. Please enter the correct OTP sent to your mobile. </strong>"+
					"</div>");	
		} else {
			$("#verifyOtpForm").ajaxForm({
				dataType: 'json',
				beforeSend: function(e) { 
					$("#preview").html("<img src='images/ajax_loading.gif'><br>Processing");
					$("#btnVerifyOTP").attr("disabled","disabled"); 
				},	
				uploadProgress: function(e) { },
				success:   function(data) {
					//$("#verifyOtpForm").hide();  										  		
					$("#preview").empty();
					if(data.verifyOtpStatus == true) {																
						$("#otp").val("");
						$("#verifyOtpForm").hide();
						
						$("#preview").html("<div class='alert alert-success'>"+
							"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
							"    <strong> Your OTP is successfully verified. </strong>"+
							"</div>");
							
						$("#finishForm").show();																		
					} else {
							$("#preview").html("<div class='alert alert-danger alert-error'>"+
							"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
							"    <strong> Invalid OTP. Please enter the correct OTP sent to your mobile. </strong>"+
							"</div>");
							
							$("#btnVerifyOTP").removeAttr("disabled"); 
					}
				}	 
			}).submit();
		}	
	});
	
	
	
	$("#btnFinish").click(function(e){
		e.preventDefault();
		$("#finishForm").ajaxForm({
			dataType: 'json',
			beforeSend: function(e) { 
				$("#preview").html("<img src='images/ajax_loading.gif'><br>Processing");
				$("#finishForm").hide(); 
			},	
			uploadProgress: function(e) { },
			success:   function(data) {													  		
				$("#preview").empty();
				if(data.orderId.length > 0) {
						$("#preview").html("<div class='alert alert-success'>"+
										"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
										"    <strong>Congratulations! Your order has been placed. <br>Your order ID is: "+data.orderId+". <br> Our customer care executive will get back to you shortly with estimates.</strong>"+
										"</div>");
										
						$("#custName").val("");
						$("#email").val("");
						$("#mobile").val("");
						$("#address").val("");
																	
				}						
				else {
										$("#preview").html("<div class='alert alert-danger alert-error'>"+
										"    <a href='#' class='close' data-dismiss='alert'>&times;</a>"+
										"    <strong>Oops! Something happend wrong.</strong>"+
										"</div>");
				}
			}	 
		}).submit();			
	});	
	
	

});
	function validateEmail(email) {
		var atpos = email.indexOf("@");
		var dotpos = email.lastIndexOf(".");
		if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
			return false;
		} else {
			return true;
		}
	}	
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


<jsp:include page="terms.jsp"></jsp:include>

<div id="menu-desktop" class="menu sec_header">
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
	
	

	
    <div class="container">
    <br/>
    
    <h3>Place Order:</h3>    
    
    <div id="preview" class="text-center" style="margin-top:15px; margin-bottom:30px;"> </div>
    
    <div class="row" id="order_div">
    	<div class="col-md-3 col-lg-3 text-center" style="margin-bottom:50px;">
    		<s:if test="workTypeId == 1">
		    	<div> <img src="images/img1.png"/> </div>
		    	<div class="sub_head">   
					<img src="images/sub_head_1.png"/>
					<p class="sub_heading_desc">Burnt switches, Fans, Wiring</p> 
				</div>    
		    </s:if>
    		<s:if test="workTypeId == 2">
		    	<div class="text-center"> <img src="images/img2.png"/> </div>
		 		<div class="sub_head">   
					<img src="images/sub_head_2.png"/> 
					<p class="sub_heading_desc">Kitchen, Bathrooms, Sewage</p> 
				</div>    		
		    </s:if>
		    <s:if test="workTypeId == 3">
					<div style="padding-top:15px;">	<img src="images/img3.png"/> </div>
					<div class="sub_head">   <img src="images/sub_head_3.png"/> 
						<p class="sub_heading_desc">Interiors, Outdoors, Painters</p> 
					</div>    		
		    </s:if>		    
		    <s:if test="workTypeId == 4">
					<div style="padding-top:15px;">	<img src="images/img4.png"/> </div>
					<div class="sub_head">   <img src="images/sub_head_4.png"/> 
						<p class="sub_heading_desc">Woodworking, Cabinetry, and Crown Molding, General Carpentry</p> 
					</div>	    		
		    </s:if>
		    <s:if test="workTypeId == 5">
					<div style="padding-top:15px;">	<img src="images/img5.png"/> </div>
					<div class="sub_head">   <img src="images/sub_head_5.png"/> 
						<p class="sub_heading_desc">Building Constructions, Concrete, Waterproofing</p> 
					</div>	    		
		    </s:if>
		    <s:if test="workTypeId == 6">
					<div style="padding-top:15px;">	<img src="images/img6.png"/> </div>
					<div class="sub_head">   <img src="images/sub_head_6.png"/> 
						<p class="sub_heading_desc">Deep Borewells, Water level estimations</p> 
					</div>	    		
		    </s:if>
		    <s:if test="workTypeId == 7">
					<div style="padding-top:15px;">	<img src="images/img7.png"/> </div>
					<div class="sub_head">   <img src="images/sub_head_7.png"/> 
						<p class="sub_heading_desc">AC/TV Repairs, Laptop/Computer Repairs</p> 
					</div>	    		
		    </s:if>
		    <s:if test="workTypeId == 8">
					<div style="padding-top:15px;">	<img src="images/img8.png"/> </div>
					<div class="sub_head">   <img src="images/sub_head_8.png"/> 
						<p class="sub_heading_desc">Driving School</p> 
					</div>	    		
		    </s:if>
		    <s:if test="workTypeId == 9">
					<div style="padding-top:15px;">	<img src="images/img9.png"/> </div>
					<div class="sub_head">   <img src="images/sub_head_9.png"/> 
						<p class="sub_heading_desc">Certified packers and movers</p> 
					</div>	    		
		    </s:if>		    
		    <br/>
     		<a href="welcome-to-clik2fix-home-improvement-services">Change Request</a>
    	</div>
    	<div class="col-md-9 col-lg-9 text-center">
		   	<form id="orderForm" name="orderForm" class="form-horizontal" style="padding-left:30px; padding-right:30px;" action="send-otp-clik2fix" method="post">
		   		<input type='hidden' id='workTypeId' name='workTypeId' value='<s:property value="workTypeId"/>'/>
		   	    <div class="form-group">		            
	            	<s:select cssClass="form-control" id="areaId" name="areaId" list="areaMap"></s:select>
		        </div>   	
		   	    <div class="form-group">		            
	                <input class="form-control" id="custName" name="custName" placeholder="Name">
		        </div>
		        <div class="form-group">		            
	               <textarea class="form-control" id="address" name="address" placeholder="Address"></textarea>
		        </div>        
		        <div class="form-group">		            
	                <input class="form-control" id="email" name="email" placeholder="Email">
		        </div>
		        <div class="form-group">		            
	                <input class="form-control" id="mobile" name="mobile" placeholder="Mobile">
		        </div>
		        <div class="form-group">		            
	                <textarea class="form-control" id="workSummary" name="workSummary" placeholder="Request Summary"></textarea>
		        </div>        
		        <div class="form-group">
	                <button id="btn_place_order" name="btn_place_order" class="btn btn-primary btn-lg">Place Order</button>
		        </div>
		        Please <b>NOTE: YOU</b> will be charged a booking amount of <b>Rs.100</b> after the problem is resolved by the worker assigned to you. All orders raised after 7PM will be addressed on the next working day.
		    </form>    		
    	</div>
    </div>
    
    <center>
    <form id="verifyOtpForm" name="verifyOtpForm"  action="verify-otp-clik2fix"  class="form-inline" style="display:none">
			<p>Please enter the One Time Password sent to your mobile.</p>  <br/>          	            		
    		One Time Password &nbsp; <input class="form-control" id="otp" name="otp" placeholder="OTP"/>
    		<button class="btn btn-success" id="btnVerifyOTP" name="btnVerifyOTP">Verify</button>    
    </form>
    
    <form id="finishForm" name="finishForm"  action="confirm-clik2fix-order" class="form-inline" style="display:none">
 		<button class="btn btn-success btn-lg" id="btnFinish" name="btnFinish">Finish Placing Order</button>
    </form>
    </center>
    
	<br/><br/><br/><br/><br/><br/>
    </div>
	 
	 
	<hr/>
	<jsp:include page="credits.jsp"></jsp:include>	

</body>
</html>


