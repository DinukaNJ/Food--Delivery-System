
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
				<div class="col-md-12 col-md-offset-0 text-left">
                                    
                                
					

					<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
                                                        <h1 class="display-1 text-center">All in good taste!</h1>
							<span class="intro-text-small text-center">People Who Love To Eat Are Always The Best <a href="#" target="_blank">People</a></span>
                                                                                                <form method="post" action="SearchLoading">
												<div class="form-row">
                                                                                                    <div class="form-group">
                                                                                                        
                                                                                                            <div class="col-md-12">
                                                                                                                    
                                                                                                                <input 
                                                                                                                    style=" 
                                                                                                                    
                                                                                                                    color:white;
                                                                                                                    font-size:20px ;
                                                                                                                    border-color: white;" 
                                                                                                                    class="form-control" 
                                                                                                                    type="search" 
                                                                                                                    placeholder="Search" 
                                                                                                                    name="search" 
                                                                                                                    value="" 
                                                                                                                    aria-label="Search">
                                                                                                                
                                                                                                               
                                                                                                            
                                                                                                            </div>
                                                                                                        
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="form-row col-md-12" style="margin-top:12px;">
                                                                                                    <div class="form-group">
                                                                                                        <input type="submit" class="btn btn-primary btn-block" value="Search" >
                                                                                                    </div>
                                                                                                </div>
                                                                                                </form>
                                                                                                                   
                                   
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<h1 class="mt-sm text-center p-3">Sign In</h1>
											<form class="mt-sm" action="Authentication" method="POST">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="inputEmail">Username</label>
														<input type="text" name="uname" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="inputPassword">Password</label>
														<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
													</div>
												</div>
												

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary btn-block" value="Sign In">
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

	
	
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 class="cursive-font primary-color">Popular Dishes</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
				</div>
			</div>
                    
                    
                    
                    
                    
                    
                    
                    
			<div class="row">

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="LoadingFoods?period=breakfast" class="fh5co-card-item ">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/breakfast.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Special Breakfast</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="price cursive-font">Breakfast</span></p>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="LoadingFoods?period=lunch" class="fh5co-card-item ">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/lunch.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Special Lunch</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="price cursive-font">Lunch</span></p>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="LoadingFoods?period=dinner" class="fh5co-card-item ">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/dinner.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Special Dinner</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="price cursive-font">Dinner</span></p>

						</div>
					</a>
				</div>


				

				

			</div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
		</div>
	</div>
	
	<div id="gtco-features">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading animate-box">
					<h2 class="cursive-font">Our Services</h2>
					<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="ti-face-smile"></i>
						</span>
						<h3>Happy People</h3>
						<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="ti-thought"></i>
						</span>
						<h3>Creative Culinary</h3>
						<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="feature-center animate-box" data-animate-effect="fadeIn">
						<span class="icon">
							<i class="ti-truck"></i>
						</span>
						<h3>Food Delivery</h3>
						<p>Dignissimos asperiores vitae velit veniam totam fuga molestias accusamus alias autem provident. Odit ab aliquam dolor eius.</p>
					</div>
				</div>
				

			</div>
		</div>
	</div>


	



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

