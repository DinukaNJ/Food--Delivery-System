<%-- 
    Document   : customize.jsp
    Created on : Sep 20, 2020, 10:17:00 PM
    Author     : Dinuka NJ
--%>
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
							<h1 class="display-1 text-center">Customize it as you wish !</h1>
							<span class="intro-text-small text-center">People Who Love To Eat Are Always The Best <a href="#" target="_blank">People</a></span>
								
						</div>
						
					</div>
							
					
				</div>
			</div>
		</div>
	</header>   
                                                
                <%! 
                    String id;
                    String pname;
                    String type;
                    double total;
                    String dis="";
                %>
         
         	<div class="gtco-section">
		<div class="gtco-container">
                        
			<div class="row">

				
                                        <% 
                                        String uid = (String) request.getSession().getAttribute("uid");
                                        List<items> itemList = (ArrayList<items>) request.getAttribute("items");
                                        for(items it : itemList){ 
                                                //set product name and id as global variables
                                                id=it.getId();
                                                pname=it.getName();
                                                type=it.getType();
                                                total=it.getPrice();
                                        %>
                                            <div class="col-lg-12 col-md-12 col-sm-6">
                                                <div class="fh5co-card-item">
                                                        <figure>
                                                                <div class="overlay"><i class="ti-plus"></i></div>
                                                                <img src="assets/products/<%= it.getPimgpath()%>" alt="Image" class="img-responsive">
                                                        </figure>
                                                        <div class="fh5co-text">
                                                                <h2><%= it.getName()%></h2>
                                                                <p><%= it.getDes()%></p>
                                                                <p><span class="price cursive-font">Rs <%= it.getPrice()%></span></p>
                                                        </div>
                                                </div>
                                            </div>
                                        <%
                                           }
                                        %>
				
                        </div>
                        
                                        
                        <div class="row">
                            <div class="card text-center col-md-12">
                                <div class="card-header ">
                                    <h2 class="display-4 cursive-font primary-color">Additional Customizations</h2>
                                </div>
                            </div>
                            
                            
                               
                            <table class="table table-borderless">
                            <tbody>
                                <% 
                                    List<option> optionsList = (ArrayList<option>) request.getAttribute("options");
                                    for(option op : optionsList){
                                %>
                                <form action="CustomizeServlet" method="post">
                                 <tr>
                                    
                                    <th class="text-center"><%=op.getOptions() %></th>
                                    <th class="text-center">Rs.<%=op.getPrice() %></th>
                                    <th class="text-center">
                                        <div class="quantity ">
                                        <button class="minus-btnn" type="button" name="button">
                                            -
                                          </button>

                                        <input type="text" name="noptions"  value="0">
                                        <button class="plus-btnn" type="button" name="button">
                                            +
                                        </button>
                                        </div>
                                    </th>
                                    <th class="text-center">
                                        
                                        <input type="submit" class="btn btn-primary btn-block" value="Add"/>
                                        <input type="hidden" name="uid" value="<%=uid%>"/>
                                        <input type="hidden" name="pid1" value="<%= id %>"/>
                                        <input type="hidden" name="pname" value="<%= pname %>"/>
                                        <input type="hidden" name="ptype" value="<%= type %>"/>
                                        <input type="hidden" name="oprice" value="<%=op.getPrice() %>"/>
                                        <input type="hidden" name="option" value="<%=op.getOptions() %>"/>
                                    </th>
                                  </tr>
                                 </form>
                                <%
                                    }
                                 %>
                            </tbody>
                            </table>
                            
                           
                             
                        </div> 
                            
                            <div class="row">
                                 <table class="table table-bordered text-center ">
                                     <thead>
                                      <tr>
                                          <th scope="col" class="text-center">Options</th>
                                        <th scope="col" class="text-center">Number Of Options </th>
                                        <th scope="col" class="text-center">Price</th>
                                        <th scope="col" class="text-center">Remove</th>
                                      </tr>
                                    </thead>
                                    <tbody>

                                  <!--       some time we must have to current user id this is the reminder for it with link-->

                                       <% dis=""; %>  
                                       
                                          <% 
                                           List<cutomize> cutomizeList = (ArrayList<cutomize>) request.getAttribute("coutomizeitems");
                                                         for(cutomize cu : cutomizeList){

                                          %> 
                                      <tr>

                                        <td><%=cu.getOptions() %></td>
                                        <td><%=cu.getNoptions() %></td>
                                        <td><%=cu.getTotal() %></td>

                                        <% dis= dis+cu.getOptions()+"*"+cu.getNoptions()+",\n";%>
                                        <% total=total+cu.getTotal(); %>

                                        <td><a class="btn btn-primary btn-block" href="DeleteOptions?itemid=<%= id %>&opid=<%= cu.getId() %> " role="button">Remove</a></td>

                                      </tr>
                                         <% } %>
                                         <tr>
                                       <h1><%=dis %></h1>      

                                             <td></td>
                                             <td>Total</td>
                                             <td><%= total %></td>
                                         </tr>
                                    </tbody>
                                  </table>   
                                   <form action="AddtoCart" method="post">
                                    <input type="hidden" value="<%= id %>" name="pid2"/>
                                    <input type="hidden" value="<%= pname %>" name="pname"/>
                                    <input type="hidden" value="<%= dis %>" name="odis"/>
                                    <input type="hidden" value="<%= total %>" name="total"/>
                                    
                                    <div class="col-md-12 col-sm-12" style="margin-top:12px;">
                                            <div class="form-group">
                                                <input type="submit" class="btn btn-primary btn-block" value="Add to cart" >
                                            </div>
                                    </div>
</form>
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
        
        <script type="text/javascript">
            $('.minus-btnn').on('click', function(e) {
              e.preventDefault();
              var $this = $(this);
              var $input = $this.closest('div').find('input');
              var value = parseInt($input.val());

              if (value > 1) {
                value = value - 1;
              } else {
                value = 0;
              }

              $input.val(value);

            });

            $('.plus-btnn').on('click', function(e) {
              e.preventDefault();
              var $this = $(this);
              var $input = $this.closest('div').find('input');
              var value = parseInt($input.val());

              if (value < 100) {
                value = value + 1;
              } else {
                value =100;
              }

              $input.val(value);
            });


          </script>


	</body>
</html>