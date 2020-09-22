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
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    MFood Order System for NSBM Canteen
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="css/profile.css?v=2.1.2" rel="stylesheet" />

</head>

<body class="">
  
    <div class="main-panel">
      <!-- Navbar -->
     
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">Edit Profile</h4>
                  <p class="card-category">Complete your profile</p>
                </div>
                <div class="card-body">
             <%!String imgpath; %>      
           
                    
                    
                     <% 
         List<user> userList = (ArrayList<user>) request.getAttribute("profilelist");
          for(user u : userList){
 %> 
                    
                    
                    
                    <!--  from start-->
                    <form action="EditProfile" method="post"  enctype="multipart/form-data">
                            <div class="row">

                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Username</label>
                                  <input type="text" class="form-control" value="<%=u.getUname() %>" name="uname">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Email address</label>
                                  <input type="email" class="form-control" value="<%=u.getEmail() %>" name="email">
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Fist Name</label>
                                  <input type="text" class="form-control" value="<%=u.getFname() %>" name="fname">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Last Name</label>
                                  <input type="text" class="form-control" value="<%=u.getLname() %>"name="lname">
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Adress</label>
                                  <input type="text" class="form-control" value="<%=u.getAddress() %>"  name="address">
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Image</label>                       
                                </div>
                              </div>
                            </div>
                        
                          <input type="file" class="form-control" name="imgfile">
                            <button type="submit" class="btn btn-primary pull-right">Update Profile</button>
                            <div class="clearfix"></div>
                  </form>
                <!--  from End-->  
                    
                </div>
              </div>
            </div>



            <div class="col-md-4">
              <div class="card card-profile">
                <div class="card-avatar">
                  <a href="javascript:;">
                      
                   
                      <%  imgpath =u.getUid()+".png";;%>
                     
                      <img class="img" src="assets/profile/<%= imgpath%>" />
                  </a>
                </div>
                <div class="card-body">
                    <h6 class="card-category text-gray"><%= u.getRole() %></h6>
                  <h4 class="card-title"><%=u.getFname() +"\t"+u.getLname() %></h4>
                  <p class="card-description">
                 Email:<%=u.getEmail() %>
                  </p>
                  <p class="card-description">
                 Address<%=u.getAddress() %>
                  </p><br>
                </div>
              </div>
            </div>
          </div>
        </div>
                                
                                
                  
       <% 
                   
           }
       
       
       %>                              
                                
                                
      </div>
      <footer class="footer">
        <div class="container-fluid">
          
        </div>
      </footer>
    </div>
  </div>

</body>

</html>