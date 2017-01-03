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
	
<script type="text/javascript">

var ww;

function resizeMe() {
	if(ww < 600) {		
		$("#logo_desktop").hide();
		$("#map-desktop").hide();
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

	jQuery(window).scroll(function() {
		
	});

	
	$("#terms").click(function(){
		$("#termsModal").modal('show');
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


<jsp:include page="terms.jsp"></jsp:include>

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
	
	
	
    <div class="container" style="padding-top:30px;">
	<div id="page_about" style="border-top:solid 1px #CCC; border-bottom-width:0px;">
	<div class="container" >		
		
		<div id="about-desktop">
		<div class="text-center">
			<img src="images/little.png" class="little_align"/>
		</div>
		
		<div style="text-align:justify; float:left; border:solid 0px red;">
		<img src="images/about_img.png" class="img-rounded" style="float:right; padding-left:20px; "/>
			<p>		
		  		<b>'Clik'</b> and <b>'Fix'</b>?? What's this about??<br/><br/>
				Well, first of all that's an insane name (we loved it though!!). Clik2Fix helps you accomplish the basic home needs or projects that are central to your life. Whether you need to paint your home, refurbish your house interiors, revamp your walls, repair electronic appliances, resolve dripping taps or relocate to a new destination, Clik2Fix is the easiest and most dependable way to hire the right professional for your needs.

		  	</p>
		  	<p> 
		  		At Clik2Fix, we know how hard it can be to find the right person for a common home improvement service, let alone the right person who is available, nearby, and within budget. Instead of wasting time searching and playing phone tag, visiting sites who give you a list of unverified or unworthy contacts, just tell us what you need. We'll introduce you to several interested, available, and qualified professionals across the Pearl City Hyderabad who have been well examined and duly verified by the background check team (yes we emphasize more on security and quality) within no time.
		  	</p>
		  	<p> 
		  		<b>How It Works?</b> <br/>
Well, you can Accomplish (almost) anything here. And yes, we are not nuts when we say that!<br/> 
Just tell us what you need, fill in a quick fire personal details form and we'll introduce you to several qualified professionals. Then, compare and hire the pro that's right for you. All of that with just a click. Yeah!! It's that easy.
Customers get started by answering a few questions about their specific needs. Within hours, Thumbtack will start giving you estimates after due consultation and negotiation with several qualified professionals in your area. You can compare custom quotes, reviews, and profiles and hire when they're ready. And within no time you'll find the skilled worker knocking your doorsteps desperate to solve your problems. All this with a booking cost of Rs100.

		  	</p>
		  	
		  	<p>
		  		<b>Why Clik2Fix?</b> <br/>
		  		By connecting customers to the right pros', we enable independent professionals to grow their businesses and do what they love. Clik2Fix sends qualified professionals to customers' requests, and within hours, after due consultation and detailed explanation about the requirement, the customer gets an estimate. The customer will get as many as 2 estimates all at a flashy price tag of Rs100.
		  	</p>
		  	<p>
		  		<b>Who are we?</b> <br/>
		  		Bunch of people like you who had a series of unsavory experiences dealing with plumbers and electricians, which left us thinking - Why isn't this industry professional? <br/>
Also, we are thinkers, explorers and creators ... We are simple to the core. Yet, we're serious about delivering great outcomes. Allow us to serve you and we are sure we will get thumbs up from you.

		  	</p>		  	
		</div>

		</div>
		
		<div id="about-tab-mobile">
		<div class="text-center">
			<img src="images/little_mobile.png" class="little_align"/>
		</div>
		
		<div style="text-align:justify; border:solid 0px red; padding:10px;">
			<p>		
		  		'Clik' and 'Fix'?? What's this about??<br/>
				Well, first of all that's an insane name (we loved it though!!). Clik2Fix helps you accomplish the basic home needs or projects that are central to your life. Whether you need to paint your home, refurbish your house interiors, revamp your walls, repair electronic appliances, resolve dripping taps or relocate to a new destination, Clik2Fix is the easiest and most dependable way to hire the right professional for your needs.

		  	</p>
		  	<p> 
		  		At Clik2Fix, we know how hard it can be to find the right person for a common household requirement, let alone the right person who is available, nearby, and within budget. Instead of wasting time searching and playing phone tag, visiting sites who give you a list of unverified or unworthy contacts, just tell us what you need. We'll introduce you to several interested, available, and qualified professionals who have been well examined and duly verified by the background check team (yes we emphasize more on security and quality) within 24 hours and all @Rs100 (Kidding? No. Serious? Yes.).
		  	</p>
		  	<p> 
		  		<b>How It Works?</b> <br/>
Well, you can Accomplish (almost) anything here. And yes, we are not nuts when we say that!<br/> 
Just tell us what you need, fill in a quick fire personal details form and we'll introduce you to several qualified professionals. Then, compare and hire the pro that's right for you. All of that with just a click. Yeah!! It's that easy.<br/>
Customers get started by answering a few questions about their specific needs. Within hours, Thumbtack will start giving you estimates after due consultation and negotiation with several qualified professionals in your area. You can compare custom quotes, reviews, and profiles and hire when they're ready. And within no time you'll find the skilled worker knocking your doorsteps desperate to solve your problems. All this with a booking cost of Rs100.

		  	</p>		  	
		</div>
		<center>
		<div style="padding:00px;">
			<!-- <img src="images/about_img_mobile.png" class="img-rounded"/>  -->
			<img src="images/about_img.png" class="img-rounded img-responsive" style="float:right; padding-left:20px; "/>
		</div>
		</center>
		</div>
		
	</div>			
	<div style="padding-top:30px; padding-bottom:100px;">
		<div id="because-desktop">
		<div class="text-center">
			<img src="images/because.png"/>
		</div>	
		</div>
		
		<div id="because-tab-mobile">
		<div class="text-center">
			<img src="images/because_mobile.png"/>
		</div>
		</div>
	</div>	
	</div>    		
		
    </div>
	 
	<hr/>
	<jsp:include page="credits.jsp"></jsp:include>	

</body>
</html>


