<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
	
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="local search, business search engine, yellow pages, india yellow pages, business directory, local news, real estate, jobs, movies, entertainment, movie theatres, work timings, shops information, business hours, shop phone number, business address, shop address, route map, plumbers, interior designers, taxies, cab service, electrician, trade directory, travel agents, hospitals, lodging, hotels, hardware shops, paint shops, transport service, logistics, mechanics, courier service, gas booking, car dealers, automobile dealers, car service centre, bike service centre, for sale, for rent, lawyer, government office address, mobile shops, mobile phone servicing centre, computer repair, cloth showrooms">
	<meta http-equiv="description" content="Submit your business details to PEEKBIZ and get identified by millions of potential customers.">
	
	<title> About PEEKBIZ </title>	
	
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	
	<link rel="shortcut icon" href="http://localhost:8080/search/fevicon.png" type="image/png">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<script type="text/javascript" src="js/lib/jquery-1.7.2.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>  
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="css/styles.css">

<script type="text/javascript">
	$(document).ready(function() {
	  window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '594104734033863',
	    cookie     : true,  // enable cookies to allow the server to access 
	                        // the session
	    xfbml      : true,  // parse social plugins on this page
	    version    : 'v2.1' // use version 2.1
	  });
	
	  // Now that we've initialized the JavaScript SDK, we call 
	  // FB.getLoginStatus().  This function gets the state of the
	  // person visiting this page and can return one of three states to
	  // the callback you provide.  They can be:
	  //
	  // 1. Logged into your app ('connected')
	  // 2. Logged into Facebook, but not your app ('not_authorized')
	  // 3. Not logged into Facebook and can't tell if they are logged into
	  //    your app or not.
	  //
	  // These three cases are handled in the callback function.
	
	  FB.getLoginStatus(function(response) {	    
	    statusChangeCallback(response);
	  });
	
	  };
	
	  // Load the SDK asynchronously
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk')); 	  		
	  
	});  

	var accessToken;
	var userId;
	var name;
	var email;
	// This is called with the results from from FB.getLoginStatus().
	function statusChangeCallback(response) {
		// The response object is returned with a status field that lets the
		// app know the current login status of the person.
		// Full docs on the response object can be found in the documentation
		// for FB.getLoginStatus().	    

		//alert(response.status);
		if (response.status === 'connected') {
			/* alert('accessToken: ' + response.authResponse.accessToken);
			alert('userID: ' + response.authResponse.userID);
			
			$("#accessToken").val(response.authResponse.accessToken);
			$("#userId").val(response.authResponse.userID);
			 */

			accessToken = response.authResponse.accessToken;
			userId = response.authResponse.userID;

			// Logged into your app and Facebook.
			testAPI();
		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.	      
			document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
			//document.getElementById('status').innerHTML = 'Please log into Facebook.';
			//alert("Please log into Facebook");

		}
	}

	// This function is called when someone finishes with the Login
	// Button.  See the onlogin handler attached to it in the sample
	// code below.
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	// Here we run a very simple test of the Graph API after login is
	// successful.  See statusChangeCallback() for when this call is made.
	function testAPI() {
		// alert('Welcome!  Fetching your information.... ');
		FB.api('/me', function(response) {
			//alert('Successful login for: ' + response.name);	      
				/*document.getElementById('status').innerHTML =
				  'Thanks for logging in, ' + response.name + '!';
				 */

				formData(response);
			});
	}

	function formData(response) {
		name = response.name;
		email = response.email;

		if(accessToken.length > 0) {
			$("#link_signin").hide();
			$("#link_signup").hide();
			$("#user_img").attr("src", "http://graph.facebook.com/"+userId+"/picture?type=small&width=25&height=25");
			$("#user_profile_name").html(name);
			$("#link_after_login").show();	
			
			checkMobileUpdateStatus(email);		
		} else {
			$("#link_signin").show();
			$("#link_signup").show();		
		}
	}
	
</script>

<style type="text/css">
.main_title {
	font-family: 'oswald';
	font-weight: 400;
	font-size:38px;
	margin-top:20px;
	margin-bottom:20px;	
}
.para {
	font-family: 'Open Sans';
	font-size:14px;
	width:50%;
}
.team_mem_name {
	font-family: 'oswald';
	font-weight: 400;
	font-size:20px;
}
.team_mem_desig {
	font-weight:bold;
}
.profile_align {
	padding-top:50px;
	padding-bottom:50px;
}
.profile_bk {
	background-color: #F8F8F8;
}
</style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="border-radius:0px; height:70px; padding-top:10px;">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <span style="padding-top:5px;"><img src="images/logo.png"/></span>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
        <ul class="nav navbar-nav" style="padding-left:20px;">
    	 <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:#CCC;"><span id="location_name"><s:property value="#session.cityName"/></span> <span class="caret"></span></a>
          <ul id="city_drop_down" class="dropdown-menu" role="menu">          
          </ul>
        </li>
		<li><a href="movies.jsp" style="color:#CCC;" >Movies</a></li>
		<li><a href="events.jsp" style="color:#CCC;">Events</a></li>
    </ul>   	
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="index.jsp" style="color:#CCC;"><span class="glyphicon glyphicon-home" title="Lookat Home Page"></span></a></li>
        <li><a href="post-business-ad-with-lookat.jsp" style="color:#CCC;">Post Ad</a></li>      
        <li><a href="free-business-listing-with-lookat.jsp" style="color:#CCC;">Free Listing</a></li>
        
		<li class="dropdown" id="link_after_login" style="display:none;">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
          	<span id="userProfileName"> 
          		<img id="user_img" src="" style="border-radius:50%;"/> &nbsp;
          		<span id="user_profile_name" style="color:#CCC;"><s:property value="name"/></span> 
          	</span> 
          	<span class="caret"></span>
          </a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="user-listings-lookat.jsp">Listings</a></li>
            <li><a href="pageAds">Ads</a></li>
            <li class="divider"></li>
            <li><a href="#">My Profile</a></li>
            <li><a href="#">Change Password</a></li>
            <li class="divider"></li>
            <li><a id="a_signout" name="a_signout" href="#">Sign Out</a></li>
          </ul>
        </li>
       	<li id="link_signin"><a href="login-to-lookat-account.jsp" style="color:#CCC;">Log In</a></li>
       	<li id="link_signup"><a href="signup-with-lookat.jsp" style="color:#CCC;">Sign Up</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	
	
	<div class="container" style="margin-top:100px;">	
		<div class="row">
			<div class='col-md-12 col-lg-12'>				
				<p class='main_title text-center'> TEAM, WHO MADE IT POSSIBLE </p>
				<div class='row text-center'>
					<div class='col-md-3 col-lg-3 profile_align'>
						<img src="images/chaitanya.png" class="img-circle" alt="Circular Image" style='width:180px; height:180px;'>
						<div style='padding-top:20px;'>
							<p class='team_mem_name'> CHAITANYA DEVAVARAPU </p>
							<p class='team_mem_desig'> CEO & Managing Director </p>
							<hr>
							<div> A Software Engineer, an artist and a photographer. 
								He is the whole brain behind LOOKAT. He is the one who designed and coded this website.
								<br><br>Very cool, soft spoken and passionate towards technology. Prior to this, he worked in various MNCs in India as a software professional.
							</div>
						</div>
					</div>
					<div class='col-md-3 col-lg-3 profile_align profile_bk'>
						<img src="images/glory.png" class="img-circle" alt="Circular Image" style='width:180px; height:180px;'>
						<div style='padding-top:20px;'>
							<p class='team_mem_name'> GLORY EVENGILINE </p>
							<p class='team_mem_desig'> COO, HR & Public Relations </p>
							<hr>
							<div style='text-align:justified;'> A HR by profession, A social worker by passion. She is the one dependable and key decision maker. She coordinates the entire company's operations.<br><br>
							Prior to this, she worked as a HR Analyst in various MNCs in India. She loves travelling and joyfull life.</div>
						</div>
					</div>
					<div class='col-md-3 col-lg-3 profile_align'>						
						<img src="images/praveen.png" class="img-circle" alt="Circular Image" style='width:180px; height:180px;'>
						<div style='padding-top:20px;'>
							<p class='team_mem_name'> PRAVEEN DEVAVARAPU </p>
							<p class='team_mem_desig'> Head - Sales & Marketing Strategy </p>
							<hr>
							<div style='text-align:justified;'>A very energetic person. He designs and executes the companies marketing strategy and monitors the sales.
								<br><br>Prior to this, he worked in various financial institutions and contributed to the 
								growth of their sales.
							</div>
						</div>						
					</div>
					<div class='col-md-3 col-lg-3 profile_align profile_bk'>
						<img src="images/prakash.png" class="img-circle" alt="Circular Image" style='width:180px; height:180px;'>
						<div style='padding-top:20px;'>
							<p class='team_mem_name'> PRAKASH KALLA </p>								
							<p class='team_mem_desig'> Member - Marketing Advisory Board </p>
							<hr>
							<div style='text-align:justified;'>A Software Engineer, an enterprenuer, blogger and a Cricketer. He loves and lives in Cricket. 
							<br><br>He is the key advisory and coordinating member in the companie's marketing and implementation strategy.
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>	
	</div>	

	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>