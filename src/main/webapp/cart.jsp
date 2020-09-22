
<%@page import="Model.cart"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DB.Conn"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.cutomize"%>
<%@page import="Model.option"%>
<%@page import="java.util.List"%>
<%@page import="Model.items"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
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
	
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	<!-- <div class="page-inner"> -->
	<%@ include file="nav.jsp" %>  
    
      	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" style="background-image: url(images/img_bg_1.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-center">
					

					<div class="row">
						<div class="col-md-12 mt-text animate-box" data-animate-effect="fadeInUp">
							<h1 class="display-1 text-center">Your Cart</h1>
							<span class="intro-text-small text-center">People Who Love To Eat Are Always The Best <a href="#" target="_blank">People</a></span>
								
						</div>
						
					</div>
							
					
				</div>
			</div>
		</div>
	</header>   



<% 
    double total=0.0;
    int size = 0;
%>


 <% 
         List<cart> customizeList = (ArrayList<cart>) request.getAttribute("cartlist");
         size = customizeList.size(); 
 %>   
    
 
 
 <div class="gtco-section">
		<div class="gtco-container">
                        
			
          
                                        
                        <div class="row">
                            <div class="card text-center col-md-12">
                                <div class="card-header ">
                                    <h2 class="display-4 cursive-font primary-color">Your Cart Items</h2>
                                </div>
                            </div>
                            
                            
                               
                            <table class="table table-borderless">

                            <tbody>
                               <% 
                       // String uid = (String) request.getSession().getAttribute("uid");
                        total = 0;
                       for(cart ca : customizeList){

            			%>
                               
                                 <tr>
                                    
                                    <td class="text-center">
					<div class="card" style="width: 2rem;">
  						<img style="width: 35px; height:35px;" class="card-img-top"  src="assets/products/<%= ca.getPid()+".jpg"%>" alt="Card image cap">
					</div>
				    </td>
                                    
                                    <td class="text-center">
                                       <span class="intro-text-small text-center"><%= ca.getPname() %></span>
                                    </td>
                                    <td class="text-center">
                                        <span class="intro-text-small text-center">RS .<%= ca.getTotal() %></span>
                                        
                                    </td>
                                    <td class="text-center">
                                        <span class="intro-text-small text-center"><% total= total + ca.getTotal(); %></span>
                                        
                                    </td>
                                    <td class="text-center">
                                        <a href="CustomizeServlet?itemid=<%= ca.getPid()%>">
                  
                                        <button type="button" class="btn btn-block btn-outline" >Customize</button></a>
                                        
                                    </td>
                                  </tr>
                               
                               <%} %>   

                            </tbody>
                            </table>
                               
                                <button type="button" class="btn btn-block btn-primary justify-content-center" >Checkuot  [ Rs. <%=total %> ] </button>

                            
                           
                             
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











