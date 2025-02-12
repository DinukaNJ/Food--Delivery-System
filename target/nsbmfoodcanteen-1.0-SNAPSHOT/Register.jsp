<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DB.Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.cart"%>
<%@page import="Model.users.user"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.items"%>

<!DOCTYPE HTML>

<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Food Ordering System</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
        
	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<!-- <div class="page-inner"> -->
	<%@ include file="nav.jsp" %>  
        
        
	
	<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/img_bg_1.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 text-left">
                                    
                                
					

					<div class="row row-mt-15em justify-content-center">
						
						<div class="col-md-8 col-md-offset-2 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
                                                                                    <h1 class="mt-sm text-center p-3">Sign Up</h1>
											<form action="Register" method="post">
												<div class="form-row">
                                                                                                    <div class="form-group">
                                                                                                            <div class="col-md-6">
                                                                                                                    <label >First Name</label>
                                                                                                                    <input type="text" class="form-control form-control-sm" id="inputPassword4" placeholder="First Name" name="fname">
                                                                                                            </div>
                                                                                                    </div>
                                                                                                    <div class="form-group">
                                                                                                            <div class="col-md-6">
                                                                                                                    <label >Last Name</label>
                                                                                                                    <input type="text" class="form-control form-control-sm" id="inputPassword4" placeholder="Last Name" name="lname">   
                                                                                                            </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-row">
                                                                                                    <div class="form-row form-group form-control-sm">
                                                                                                            <div class="col-md-6">
                                                                                                                    <label >Email</label>
                                                                                                                    <input type="email" class="form-control" id="inputAddress" placeholder="Email" name="email">   
                                                                                                            </div>
                                                                                                    </div>
                                                                                                    <div class="form-row form-group">
                                                                                                            <div class="col-md-6">
                                                                                                                    <label >User Name</label>
                                                                                                                    <input type="text" class="form-control" id="inputAddress" placeholder="User Name" name="uname">   
                                                                                                            </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-row">
                                                                                                    <div class="form-group">
                                                                                                            <div class="col-md-6">
                                                                                                                    <label >Password</label>
                                                                                                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Password" name="pass">   
                                                                                                            </div>
                                                                                                    </div>
                                                                                                    <div class="form-group">
                                                                                                            <div class="col-md-6">
                                                                                                                    <label >Confirm password</label>
                                                                                                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Confirm password" >  
                                                                                                            </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                                    <div class="form-row form-group">
                                                                                                            <div class="col-md-12">
                                                                                                                    <label >Address</label>
                                                                                                                    <input type="text" class="form-control" id="inputAddress" placeholder="No. Ex Address, Location, Location." name="address">  
                                                                                                            </div>
                                                                                                    </div>
                                                                                                    <div class="form-row">

                                                                                                    <div class="row form-group">
                                                                                                            <div class="text-center col-md-12 mt-sm">
                                                                                                                    <input type="submit" class="btn btn-primary btn-block" value="Register Now">
                                                                                                            </div>
                                                                                                    </div>
                                                                                                    </div>
											</form>
										</div>

										
									</div>
								</div>
							</div>
						</div>
					</div>
							
					
				</div>
			</div>
		</div>
	</header>

	
	




	


	<footer id="gtco-footer" role="contentinfo" style="background-image: url(images/img_bg_1.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row row-pb-md">

				

				
				<div class="col-md-12 text-center">
					<div class="gtco-widget">
						<h3>Get In Touch</h3>
						<ul class="gtco-quick-contact">
							<li><a href="#"><i class="icon-phone"></i> +1 234 567 890</a></li>
							<li><a href="#"><i class="icon-mail2"></i> info@example.co</a></li>
							<li><a href="#"><i class="icon-chat"></i> Live Chat</a></li>
						</ul>
					</div>
					<div class="gtco-widget">
						<h3>Get Social</h3>
						<ul class="gtco-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-12 text-center copyright">
					<p><small class="block">&copy; 2020 | All Rights Reserved.</small> 
						<small class="block"><a href="#" target="_blank">NSBM 18.2 Software Engineering & Computer Science - UGC</a></small></p>
				</div>

			</div>

			

		</div>
	</footer>
	<!-- </div> -->

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>

	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>

	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	
	<script src="js/moment.min.js"></script>
	<script src="js/bootstrap-datetimepicker.min.js"></script>


	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

