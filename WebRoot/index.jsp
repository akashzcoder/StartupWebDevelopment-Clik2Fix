	<%@taglib uri="/struts-tags" prefix="s"%>
	
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
	
	<title> Clik2Fix | Home Improvement Services </title>

	<link rel="icon" type="image/vnd.microsoft.icon" href="http://www.clik2fix.com/images/png-favicon.ico" />
	
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script  type="text/javascript" src="js/typeahead.min.js"></script>
		
	<link rel="stylesheet" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans">
	
<script type="text/javascript">

var ww;

function resizeMe() {
	if(ww < 600) {
		//alert("Tab, Mobile- portrait");
		$("#search-desktop").hide();				
		$("#search-tab-mobile").show();				
		$("#logo_desktop").hide();
		//$("#menu-tab-mobile").show();
		//$("#menu-desktop").hide();
		$("#map-desktop").hide();
		//$("#map-tab-mobile").show();
		$("#about-desktop").hide();
		$("#about-tab-mobile").show();
		$("#because-desktop").hide();
		$("#because-tab-mobile").show();
		$("#happy-desktop").hide();
		$("#happy-tab-mobile").show();
		$("#we-desktop").hide();
		$("#we-tab-mobile").show();
		$("#h_menu_screen_1-desktop").hide();
		$("#h_menu_screen_1-tab-mobile").show();
		$("#having-desktop").hide();
		$("#having-tab-mobile").show();
		
		$("#tools-desktop").hide();
		$("#tools-tab-mobile").hide();
	}
	if(ww >= 600) {
		$("#search-desktop").show();
		$("#search-tab-mobile").hide();		
		$("#logo_desktop").show();
		$("#menu-tab-mobile").hide();
		//$("#menu-desktop").show();
		$("#map-desktop").show();
		$("#map-tab-mobile").hide();
		$("#about-desktop").show();
		$("#about-tab-mobile").hide();
		$("#because-desktop").show();
		$("#because-tab-mobile").hide();
		$("#happy-desktop").show();
		$("#happy-tab-mobile").hide();
		$("#we-desktop").show();
		$("#we-tab-mobile").hide();
		$("#h_menu_screen_1-desktop").show();
		$("#h_menu_screen_1-tab-mobile").hide();
		$("#having-desktop").show();
		$("#having-tab-mobile").hide();
		
		$("#tools-desktop").show();
		$("#tools-tab-mobile").hide();
	}
}

$(document).ready(function(){		
	$("#menu-desktop").hide();
	
	ww = $(window).width();	
	resizeMe();
	if(ww < 600) {
		$("#logo_desktop").hide();
	}
	if(ww >= 600) {
		$("#logo_desktop").show();
	}
	
	$(window).resize(function() {	  		  
	  ww = $(window).width();
	  resizeMe();
	});	
	
	stickMenu();
	
	jQuery(window).scroll(function() {
		stickMenu();
	});
	
	$("#terms").click(function(){
		$("#termsModal").modal('show');
	});
});

function stickMenu() {  
	var menu;
	if(ww >= 600) {
		menu = document.querySelector('.menu');
	}
	if(ww < 600) {
		menu = document.querySelector('.menu-mobile');
	}	
   if (jQuery(window).scrollTop() >= 200) { 
		$("#menu-desktop").fadeIn();
   } else {
		$("#menu-desktop").fadeOut();
   }
}

</script>

<style type="text/css">
.content_1 {
	background-image: url("images/bk_3.jpg");    
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;	
	height: 100%;
	width:100%;		
	text-align:center;		
}
.content_2 {
	background-image: url("images/bk_2.png");   
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	height:100%;
	width:100%;
	text-align:center;
}
</style>
</head>
  
<body>

<jsp:include page="terms.jsp"></jsp:include>
	
    <div id="screen_0" class="content_1">
     <div id="logo_screen_0" class="logo_align"> <img src="images/logo_home_page.png"/> </div>
     <div id="h_menu_screen_1-desktop">
     <div class="h_menu_screen_1">
				<a class="btn menu_btn_style_screen_1" href="about-clik2fix"> <img src="images/about.png" alt="About Us"/> </a>				
				<a class="btn menu_btn_style_screen_1" href="track-your-clik2fix-order"> <img src="images/track.png" alt="Track Order"/> </a>
				<a class="btn menu_btn_style_screen_1" href="services-offered-by-clik2fix"> <img src="images/services.png" alt="Services"/> </a>
				<a class="btn menu_btn_style_screen_1" href="faq-clik2fix"> <img src="images/faq.png" alt="FAQ"/> </a>
				<a class="btn menu_btn_style_screen_1" href="reach-clik2fix"> <img src="images/contact.png" alt="Contact Us"/> </a>
	 </div>
	 </div>
	 
	 <div id="h_menu_screen_1-tab-mobile">
	 <div class="h_menu_screen_1_mobile">								
				<a class="btn menu_btn_style_screen_1" href="track-your-clik2fix-order"> <img src="images/track.png" alt="Track Order"/> </a>
				<a class="btn menu_btn_style_screen_1" href="services-offered-by-clik2fix"> <img src="images/services.png" alt="Services"/> </a>
				<a class="btn menu_btn_style_screen_1" href="reach-clik2fix"> <img src="images/contact.png" alt="Contact Us"/> </a>
	 </div>
	 </div>
	 
	 <div id="we-desktop">		
     <div class="heading_1"> <img src="images/we_fix_things.png"/></div>	 
     </div>
     
     <div id="we-tab-mobile">		
     <div class="heading_1_mobile"> <img src="images/we_fix_things_mobile.png"/></div>	 
     </div>
     
     <center>
     <div id="search-desktop" class="search_box">
     	<div style="text-align:left; padding-top:25px;">
     	<form class="form-inline" action="place-clik2fix-order" method="post">
     		<div class="form-group">
     			<img src="images/find.png" class="search_label"/>
     		</div>	
	
     	    <div class="form-group">
     			<s:select cssClass="form-control search_field_1" id="workTypeId" name="workTypeId" cssStyle="width:300px;" list="workTypeMap"></s:select>
     		</div>
     		<div class="form-group">
     		<img src="images/in.png" class="search_label"/>
     		</div>
     		<div class="form-group">
     			<s:select cssClass="form-control search_field_2" id="areaId" name="areaId" cssStyle="width:300px;" list="areaMap"></s:select>	
     		</div>
     		<div class="form-group">
     		<span style="padding-left:20px;">
     		<button class="btn btn-success searchBtn">
     			<img src="images/search_label.png" style="padding-bottom:5px;">
     		</button>
     		</span>
     		</div>
     	</form>
     	</div>
     </div>
	 
	 
     <div id="search-tab-mobile" style="background-color:#E8E8E8; margin-top:20px; display:none; margin-left:20px; margin-right:20px;">
     	<div style="text-align:left; padding:25px;">
     	<form action="place-clik2fix-order" method="post">
     	<div class="form-group">
     		<img src="images/find.png"/>
     		</div>
     		<div class="form-group">
				<s:select cssClass="form-control search_field_1" id="workTypeId" name="workTypeId" cssStyle="width:100%;" list="workTypeMap"></s:select>
				</div>
				<div class="form-group"> 
     		<img src="images/in.png" style="margin-top:15px;"/>
     		</div>
     		<div class="form-group"> 
				<s:select cssClass="form-control search_field_2" id="areaId" name="areaId" cssStyle="width:100%;" list="areaMap"></s:select>
				</div>       		
     		<button class="btn btn-success searchBtn" style="height:50px; width:100%; margin-top:20px;">
     			<img src="images/search_label.png" style="padding-bottom:5px;">
     		</button>     		
     	</form>
     	</div>
     </div>
	 
     </center>
     
     <div class="call_to">
     	<img src="images/call_to.png"/>
     </div>     
    </div>

	 
<div id="menu-desktop" class="menu sec_header" style="display:none; position:fixed;">
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

	<div id="tools-desktop">
	<div class="scroll_1"> 
		<center><div class="page_heading_1"> <img src="images/we_can_do_fix.png"> </div> </center>
		
		<center>
		<div class="tools">
			<table cellpadding="0" cellspacing="0" width="960px" border="0">
			<tr>
				<td class="tool_holder"> 
					<div>	<a href="place-clik2fix-order?workTypeId=1"> <img src="images/img1.png"/> </a>  </div>
					<div class="sub_head">   
						<img src="images/sub_head_1.png"/>
						<p class="sub_heading_desc">Burnt switches, Fans, Wiring</p> 
					</div>	
									
				</td>
				<td class="tool_holder"> 
					<div>	<a href="place-clik2fix-order?workTypeId=2">  <img src="images/img2.png"/>  </a> </div>
					<div class="sub_head">   
						<img src="images/sub_head_2.png"/> 
						<p class="sub_heading_desc">Kitchen, Bathrooms, Sewage</p> 
					</div>		
								
				 </td>
				<td class="tool_holder"> 
					<div style="padding-top:15px;">	<a href="place-clik2fix-order?workTypeId=3">  <img src="images/img3.png"/>  </a> </div>
					<div class="sub_head">   <img src="images/sub_head_3.png"/> 
						<p class="sub_heading_desc">Interiors, Outdoors, Painters</p> 
					</div>									
				</td>
			</tr>
			<tr>
				<td class="tool_holder"> 
					<div>	 <a href="place-clik2fix-order?workTypeId=4"> <img src="images/img4.png"/>  </a>  </div>
					<div class="sub_head">   <img src="images/sub_head_4.png"/> 
						<p class="sub_heading_desc">Woodworking, Cabinetry, and Crown Molding, General Carpentry</p> 
					</div>					
				</td>
				<td class="tool_holder"> 
					<div>	<a href="place-clik2fix-order?workTypeId=5"> <img src="images/img5.png"/>  </a> </div>
					<div class="sub_head">   <img src="images/sub_head_5.png"/> 
						<p class="sub_heading_desc">Building Constructions, Concrete, Waterproofing</p> 
					</div>					
				 </td>
				<td class="tool_holder"> 
					<div style="padding-top:0px;">	<a href="place-clik2fix-order?workTypeId=6"> <img src="images/img6.png"/> </a>  </div>
					<div class="sub_head">   <img src="images/sub_head_6.png"/> 
						<p class="sub_heading_desc">Deep Borewells, Water level estimations</p> 
					</div>									
				</td>
			</tr>
			<tr>
				<td class="tool_holder"> 
					<div>	<a href="place-clik2fix-order?workTypeId=7"><img src="images/img7.png"/>  </a> </div>
					<div class="sub_head">   <img src="images/sub_head_7.png"/> 
						<p class="sub_heading_desc">AC/TV Repairs, Laptop/Computer Repairs</p> 
					</div>					 
				</td>
				<td class="tool_holder"> 
					<div>	<a href="place-clik2fix-order?workTypeId=8"> <img src="images/img8.png"/> </a> </div>
					<div class="sub_head">   <img src="images/sub_head_8.png"/> 
						<p class="sub_heading_desc">Driving School</p> 
					</div>					
				 </td>
				<td class="tool_holder"> 
					<div style="padding-top:0px;">	<a href="place-clik2fix-order?workTypeId=9"> <img src="images/img9.png"/>  </a> </div>
					<div class="sub_head">   <img src="images/sub_head_9.png"/> 
						<p class="sub_heading_desc">Certified packers and movers</p> 
					</div>									
				</td>
			</tr>
			</table>	
		</div>
		</center>
	</div>
	</div>

	<div id="having-desktop">
	<div class="scroll_2 content_2">
		<center>
			<div class="page_heading_2"> 
				<img src="images/having_the_skill.png">
			</div> 
			
			<a href="reach-clik2fix" class="btn btn-default btn-lg" style="height:50px; width:260px;"> 
				<img src="images/join.png" style="padding-top:4px;"/>
			</a>
			
			<div class="sub_content" style="width:600px; color: white; padding-top:40px; padding-bottom:200px;">
				We at CLIK2FIX believe in empowering the common man with all the solutions under a single roof. This has only been possible with the trained and experienced workers who have put their soul and heart in taking this entity to a new level. And if you feel you have the right zeal and skill in you, click on the JOIN US button, fill in your personal details and our customer support executive will contact you and help you onboard. 				
			</div>
		</center>
	</div>
	</div>
	
	<div id="having-tab-mobile">
	<div class="scroll_2 content_2">
		<center>
			<div class="page_heading_2"> 
				<img src="images/having_the_skill_mobile.png">
			</div> 
			
			<a href="contact.jsp" class="btn btn-default btn-lg" style="height:50px; width:260px;"> 
				<img src="images/join.png" style="padding-top:4px;"/>
			</a>
			
			<div class="sub_content" style="color: white; padding-top:40px; padding-bottom:100px; padding-left:10px; padding-right:10px;">
				We at CLIK2FIX believe in empowering the common man with all the solutions under a single roof. This has only been possible with the trained and experienced workers who have put their soul and heart in taking this entity to a new level. And if you feel you have the right zeal and skill in you, click on the JOIN US button, fill in your personal details and our customer support executive will contact you and help you onboard. 				
			</div>
		</center>
	</div>
	</div>
	
	<div id="happy-desktop">
	<div class="scroll_3">
		<center>
			<div class="page_heading_3"> 
				<img src="images/happy.png">
		 	</div> 
		 			 	
		 	<div style="padding-bottom:100px;">
		 		<table cellpadding="0" cellspacing="0" border="0" width="700px">
		 		<tr>
		 			<td valign="top" width="200px" height="200px"> <img src="images/partner_2.jpg" style="width:170px; height:170px; border-radius:50%;"/>  </td>
		 			<td valign="middle" width="100%" style="padding-left:20px;">   
		 				<div>
		 					<img src="images/cust_1_name.png">
		 				</div>
		 				<div class="sub_content">
		 					KVS Prakash (Co-Founder): Apparently, this whole thing started as Prakash was not that good in locating the skilled workers and negotiating for the best deal. As Co-Founder of the company, Prakash coordinates the marketing and business development. He has been the mastermind in setting up the business in Hyderabad.   
		 				</div>	 				
		 			</td>
		 		</tr>
		 		</table>	

		 		<table cellpadding="0" cellspacing="0" border="0" width="700px">
		 		<tr>
		 			<td valign="middle" width="100%" style="padding-left:20px;">   
		 				<div>
		 					<img src="images/cust_2_name.png">
		 				</div>
		 				<div class="sub_content">
		 					GV GiriBabu (Managing Director): A lecturer by profession, Giri manages everything behind the stage from budget allocation to finances to future policies. One of his prime areas of focus is ensuring the betterment of the existing business model and elevate it to the next level.  
		 				</div>	 				
		 			</td>				
		 			<td valign="top" width="200px" height="200px"> <img src="images/partner_1.jpg" style="width:170px; height:170px; border-radius:50%;"/>  </td>

		 		</tr>
		 		</table>				
		 	</div>		 	
		 	
		 </center>
	</div>
	</div>
		
	
	<div id="happy-tab-mobile">
	<div class="scroll_3">
		<center>
			<div class="page_heading_3"> 
				<img src="images/happy_mobile.png">
		 	</div> 
		 	<div style="padding-bottom:100px;">
			 	<img src="images/partner_2.jpg" style="width:170px; height:170px; border-radius:50%;"/> <br/>
			 	<img src="images/cust_1_name.png" style="padding-top:20px;">
			 	<div class="sub_content" style="text-align: center; padding-left:10px; padding-right:10px;">
			 		KVS Prakash (Co-Founder): Apparently, this whole thing started as Prakash was not that good in locating the skilled workers and negotiating for the best deal. As Co-Founder of the company, Prakash coordinates the marketing and business development. He has been the mastermind in setting up the business in Hyderabad.  
			 	</div>
		 	</div>
		 	<div style="padding-bottom:100px;">
			 	<img src="images/partner_1.jpg" style="width:170px; height:170px; border-radius:50%;"/> <br/>
			 	<img src="images/cust_2_name.png" style="padding-top:20px;">
			 	<div class="sub_content" style="text-align: center; padding-left:10px; padding-right:10px;">
			 		GV GiriBabu (Managing Director): A lecturer by profession, Giri manages everything behind the stage from budget allocation to finances to future policies. One of his prime areas of focus is ensuring the betterment of the existing business model and elevate it to the next level.  
			 	</div>
		 	</div>		 	
		 </center>
	</div>
	</div>
	 	
	<br/><br/><br/> 	
	<center>
		<img src="images/nutshell.png" class="img-responsive"/><br/><br/><br/>
		<iframe width="560" height="315" src="//www.youtube.com/embed/LmLEI7HatlY" frameborder="0" allowfullscreen=""></iframe>
	</center>
	<br/><br/><br/>
	<hr/>
	<jsp:include page="credits_regular.jsp"></jsp:include>
	
</body>
</html>

