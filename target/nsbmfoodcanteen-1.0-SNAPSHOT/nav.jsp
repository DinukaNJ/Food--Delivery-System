	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo"><a href="index.jsp">Food Court <em>.</em></a></div>
				</div>
				<div class="col-xs-8 text-right menu-1">
                                      <%!  String imgpath;
                                      String uname;
                                      Connection conn=Conn.getConnection();
                                      String uid;
                                      int size = 0;
                                      %>
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="LoadingFoods?period=false">Foods</a></li>
						<li><a href="about.jsp">About Us</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
                                                
                                                <% if (session.getAttribute("uid") == null) { %>
                                                
                                                <li class="btn-cta"><a href="Register.jsp"> <span>Register</span></a></li>
                                                <li class="btn-cta"><a href="Login.jsp">Log In</a></li>
                                                <% } else {%>
                                                    <%         uid = (String) (request.getSession().getAttribute("uid") != null ? request.getSession().getAttribute("uid"):"");

                                                               if(!uid.equals("")) {
                                                               imgpath=uid+".png";
                                                               }else{
                                                               imgpath="pic.jpg";

                                                               }

                                                               String username = (String) (request.getSession().getAttribute("uname") != null ? request.getSession().getAttribute("uname"):"");

                                                               if(!uid.equals("")) {
                                                               uname=username;
                                                               }else{
                                                               uname="user";
                                                               }


                                                    %>
                                                 <li>
                                                     <a href="LoadProfile"><img src="assets/profile/<%=imgpath %>" style="width:43px;height: 43px; border-radius:20px; padding:5px;"></a>
                                                     <a id="shcart" href="Loadingcart" class="cart position-relative d-inline-flex" aria-label="View your shopping cart" style="margin-top: 10px;color: #fff; padding:3px;">
                                                                   <i class="fa" style="font-size:24px">&#xf07a;</i>
                                                                  <span>
                                                                     <% 
                                                                     // to show the number of carts
                                                                      String query="SELECT * FROM `cart` WHERE  `uid`='"+uid+"'";  
                                                                      size=0;
                                                                      try{
                                                                      Statement st = conn.createStatement();          
                                                                      ResultSet rs = st.executeQuery(query);
                                                                      while(rs.next()){
                                                                      size=size+1;
                                                                      }
                                                                      }catch(SQLException ex){
                                                                          System.out.println(ex.toString());
                                                                      }

                                                                     %>

                                                                     <%= size %>
                                                                  </span>
                                                          </a>
                                                 </li>
                                                 
                                               
                                                 
                                                 <li class="has-dropdown">
                                                    <a href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <%=uname %> <i class="fa">&#x25BC</i>
                                                    </a> 
                                                    <ul class="dropdown">
                                                        <li><a href="">Favourites</a></li>
                                                        <li><a href="Loadingcart">My Cart</a></li>
                                                        <li><a href="LoadProfile">My Profile</a></li>
                                                        <li>
                                                        <!-- method for logout-->
                                                        <form method="post" action="Logout"> 
                                                            <input class="btn btn-block btn-primary" type="submit"  value="logout" />
                                                        </form>     
                                                        </li>
                                                    </ul>
                                                  </li>
                                                  
                                                <% } %>
      
                                                    
                                                 
                                         
					</ul>	
				</div>
			</div>
			
		</div>
	</nav>
        