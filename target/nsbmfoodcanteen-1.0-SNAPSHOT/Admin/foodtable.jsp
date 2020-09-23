
<%@page import="Model.items"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="components/img/apple-icon.png">
  <link rel="icon" type="image/png" href="components/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Food Order System for NSBM Cantenn
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/Admin/components/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
  
  
<!-- javaScrpit codes -->




</head>

<body class="">
<div class="wrapper ">
    <div class="sidebar" data-color="green" data-background-color="white" data-image="../assets/img/sidebar-1.jpg">
      <!--
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
     <div class="logo"><a href="http://nsbmcanteen.com" class="simple-text logo-normal">
              <img src="${pageContext.request.contextPath}/assets/icon/nsbmlogo.png" width="60px;">
          NSBM Canteen
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item  ">
            <a class="nav-link" href="${pageContext.request.contextPath}/Admin/index.jsp">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
<!--          <li class="nav-item ">
            <a class="nav-link" href="./userprofile.jsp">
              <i class="material-icons">person</i>
              <p>User Profile</p>
            </a>
          </li>-->
          <li class="nav-item active ">
            <a class="nav-link" href="${pageContext.request.contextPath}/LoadAllTables">
              <i class="material-icons">content_paste</i>
              <p>Table List</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath}/LoadUser">
              <i class="material-icons">people</i>
              <p>Users</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="#">
              <i class="fa fa-cutlery "></i>
              <p>Food Management</p>
            </a>
          </li>
          
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
     
       <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">Foods Table</a>
          </div>
             <jsp:include page="./components/header.jsp"></jsp:include>

        </div>
      </nav>
  
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
   
              
              
<!--modal start--><!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header ">
                  <h5 class="modal-title" id="exampleModalLabel">Add Foods</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <!--  model login form -->
                  <form   action="${pageContext.request.contextPath}/AddFoods" method="POST"  enctype="multipart/form-data">
                    <div class="form-group row">
                     
                      <div class="col-sm-10">
                          <input type="text" class="form-control"  placeholder="Food Name"  name="fdname">
                      </div>
                    </div>
                      <div class="form-group row">  
                          <label  class="col-sm-2 col-form-label">food descrption</label>
                      </div>
                     
                    <div class="form-group row">
                       
                      <div class="col-sm-10">

                          <textarea placeholder="food descrption" rows = "4" cols = "50"  name="fddes"> 
                              

                          </textarea>
                      </div>
                    </div>
                     <div class="form-group row">
                     
                      <div class="col-sm-10">
                         <input type="text" class="form-control"  placeholder="Price"  name="fdprice">
                      </div>
                    </div>
                      
                 
                      
                       <div class="form-group row">
                           <div class="col-sm-10">
                      <label for="sel1">Type</label>
                      <select class="form-control" id="fdtype" name="fdtype">
                          <option value="Fried Rice">Fried Rice</option>
                          <option value="Rice and Curry">Rice and Curry</option>
                          <option value="Kottu">Kottu</option>
                          <option value="Short Eats">Short Eats</option>
                           <option value="Other">Other</option> 
                           <option value="String hoppers">String hoppers</option> 
                           <option value="Grain">Grain</option>
                           <option value="Noodles">Noodles</option>
                           
                      </select>
                    </div>
                      </div>
                      
                    <div class="form-group row">
                        <div class="col-sm-10">
                      <label for="sel1">Category</label>
                      <select class="form-control" id="fdcat" name="fdcat">
                          <option value="beverages">Beverages</option>
                          <option value="food">Food</option>
                          <option value="dessert">Dessert</option>
                          <option value="sweet">Sweet</option>
                           
                           
                      </select>
                    </div>
                      </div>
                    <div class="form-group row">
                        <div class="col-sm-10">
                      <label for="sel1">Period</label>
                      <select class="form-control" id="fdperiod" name="fdperiod">
                          <option value="breakfast">Breakfast</option>
                          <option value="lunch">Lunch</option>
                          <option value="dinner">dinner</option>
                          <option value="any">Any</option>
                           
                           
                      </select>
                     
                      
                    </div>
                      </div>
                    
                     <div class="form-group row">
                         <div class="col-sm-10">
                        <label for="sel1">Food Image</label>
                      </div>
                      </div>
                    <div class="col-sm-10">
                      <input type="file" class="form-control" name="fdimmg"> 
                      </div>
                    <div class="modal-footer">
                      <div class="col-sm-10 text-right">
                          
                            
                        <button type="submit" class="btn btn-success">Add</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </form>
                    
                    
                    
                </div>
              
              </div>
            </div>
        </div>
<!--model end-->
              
              
              
              
              
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
  Add
</button>
         

            <div class="col-md-12">
                
<% String error = (String) (request.getSession().getAttribute("error") != null ? request.getSession().getAttribute("error"):"");

if(error.equals("true")){
   

%>
            
   <h3 style="color: red;float: right;"> Error <h3> <br>  
            
            <%
                
          
    }

else if(error.equals("false")){
%>
            
<h3 style="color: green;float: right;"> Success <h3> <br>   
            
            <%

}


%>
              <div class="card">
                <div class="card-header card-header-success">
                  <h4 class="card-title ">Food Detais</h4>
                  <p class="card-category"> Here is a subtitle for this table</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-success">
                        <th>
                           ID
                        </th>
                        <th>
                        Name
                        </th>
                        <th>
                         Description
                        </th>
                        <th>
                         Price
                        </th>
                        <th>
                        Type
                        </th>
                        <th>
                          Category
                        </th>
                        <th>
                          Period
                        </th>
                        <th>
                          Image Path
                        </th>
                         <th>
                          Image Update
                        </th>    
                        
                      </thead>
                      <tbody>
        <% 
   List<items> itemList = (ArrayList<items>) request.getAttribute("itemslist");
                       for(items it : itemList){
                            
            %>                     
                     
                          
                          
    <form   action="${pageContext.request.contextPath}/EditFoods" method="POST"  enctype="multipart/form-data" >         
                        <tr>
                          <td>
                              <input type="hidden" value="<%= it.getId()%>" name="id"/>    
                          <%= it.getId()%>
                          </td> 
                          <td>
                              
                              <input type="text" value="<%= it.getName()%>" name="fdname"/>                              

                            
                          </td>
                          <td>
                              
                          <input type="text" value="<%= it.getDes()%>" name="fddes"/>          
                            
                          </td>
                          <td>
                              
                              <input type="text" value="<%= it.getPrice()%>" name="fdprice"/>  
                            
                          </td>
                          
                           <td>
                    <select class="form-control" id="fdcat" name="fdcat">
                                   
                         <option value="<%= it.getCat()%>"><%= it.getCat()%></option>
                          <option value="beverages">Beverages</option>
                          <option value="food">Food</option>
                          <option value="dessert">Dessert</option>
                          <option value="sweet">Sweet</option>
                           
                           
                      </select>
                           
                          </td>
                          
                          <td>
                    <select class="form-control" id="fdtype" name="fdtype">
                         <option value="<%= it.getType()%>"><%= it.getType()%></option>
                          <option value="Fried Rice">Fried Rice</option>
                          <option value="Rice and Curry">Rice and Curry</option>
                          <option value="Kottu">Kottu</option>
                          <option value="Short Eats">Short Eats</option>
                           <option value="Other">Other</option> 
                           <option value="String hoppers">String hoppers</option> 
                           <option value="Grain">Grain</option>
                           <option value="Noodles">Noodles</option>
                           
                      </select>
                              
                              
                          
                          </td>
                          <td>
                              
                       <select class="form-control" id="fdperiod" name="fdperiod">
                           
                           <option value="<%= it.getPeriod()%>">  <%= it.getPeriod()%></option> 
                          <option value="breakfast">breakfast</option>
                          <option value="lunch">lunch</option>
                          <option value="dinner">dinner</option>
                          <option value="any">any</option>
                          
                           
                      </select>        
                              
                       
                          </td>
                          <td>
                             <%= it.getPimgpath()%>
                          </td>
                          <td>
                               <input type="file" class="form-control" name="fdimmg"> 
                          </td>
                          
                          <td class="td-actions text-right">
                              
                              <button type="submit" rel="tooltip" title="Edit " value="edit" class="btn btn-success btn-link btn-sm">
                                <i class="material-icons">edit</i>
                              </button>
                              
                          
                              
                              <a href="DeleteFoods?id=<%= it.getId()%>">
                            <button type="button" rel="tooltip" title="Delete" class="btn btn-danger btn-link btn-sm">
                                
                               
                              <i class="material-icons">close</i>
                            </button>
                              </a>    
                                  
                          </td>
                        </td>
                        </tr>
                        
                        
    </form>                        
<% }%>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            
          </div>
        </div>
      </div>
      <footer class="footer">
        <div class="container-fluid">
          
        </div>
      </footer>
    </div>
  </div>
  <div class="fixed-plugin">
    
  </div>

</body>
 <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/Admin/components/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/Admin/components/js/core/bootstrap-material-design.min.js"></script>
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/Admin/components/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath}/Admin/components/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
</html>