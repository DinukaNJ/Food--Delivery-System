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
        <style>
            .profile-button {
    background: rgb(99, 39, 120);
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #ffffff
}

.profile-button:focus {
    background: #682773;
    box-shadow: none
}

.profile-button:active {
    background: #682773;
    box-shadow: none
}

.back:hover {
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 14px;
    margin-top:9px;
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}
.rounded-circle {
    border-radius: 10%!important
    
}
        </style>
        
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
							<h1 class="display-1 text-center">My Profile</h1>
							<span class="intro-text-small text-center">People Who Love To Eat Are Always The Best <a href="#" target="_blank">People</a></span>
								
						</div>
						
					</div>
							
					
				</div>
			</div>
		</div>
	</header>   
            
<% 
         List<user> userList = (ArrayList<user>) request.getAttribute("profilelist");
         for(user u : userList){ 
%> 

<div id="gtco-features-2">
    <div class="gtco-container">
    <div class="row">
        <div class="col-md-3 border-right">
            <%  imgpath =u.getUid()+".png";;%>
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img style="max-width:200px; height:auto; box-shadow:2px;" class="rounded-circle mt-5" src="assets/profile/<%= imgpath%>"><h3 style="margin-top:10px; font-weight:10px;" class="text-center"><%=u.getFname() %> <%=u.getLname() %></h3></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h1 class="text-left">Profile Settings</h1>
                </div>
                <form action="EditProfile" method="post"  enctype="multipart/form-data">
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="labels">Username</label><input  type="text" class="form-control" value="<%=u.getUname() %>" name="uname" placeholder="<%=u.getUname() %>"></div>
                            <div class="col-md-6"><label class="labels">Email Address</label><input type="email" class="form-control" value="<%=u.getEmail() %>" name="email" placeholder="<%=u.getEmail() %>"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Fist Name</label><input type="text" class="form-control" value="<%=u.getFname() %>" name="fname" placeholder="<%=u.getFname() %>" ></div>
                            <div class="col-md-12"><label class="labels">Last Name</label><input type="text" class="form-control" value="<%=u.getLname() %>"name="lname" placeholder="<%=u.getLname() %>"></div>
                            <div class="col-md-12"><label class="labels">Address</label><input  type="text" class="form-control" value="<%=u.getAddress() %>"  name="address" placeholder="<%=u.getAddress() %>"></div>
                            <div class="col-md-12"><label class="labels">Profile Picture</label><input type="file" class="form-control" name="imgfile"></div>
                        </div>

                        <div class="mt-sm text-center">
                            <button type="submit" class="btn btn-block btn-primary justify-content-center" >Save Profile</button>
                        </div>
                </form>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
                
            </div>
        </div>
    </div>
</div>
</div>

        <% } %>

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