 <!-- Navbar -->
  <%!  String imgpath;
           String uid="1";
           
           %>
 
 <%          uid = (String) (request.getSession().getAttribute("uid") != null ? request.getSession().getAttribute("uid"):""); 
 
            imgpath=uid+".png";
 %>
 
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
              <a><%= (String) (request.getSession().getAttribute("uname") != null ? request.getSession().getAttribute("uname"):"") %></a>
              

            <ul class="navbar-nav">
              
              
              <li class="nav-item dropdown">
                <a class="nav-link" href="javascript:;" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/assets/profile/<%= imgpath %>" style="width:50px;height: 50px; border-radius:30px;">
                  <p class="d-lg-none d-md-block">
                    Account
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                  <a class="dropdown-item" href="viewuser.html">Edit Profile</a>
                   <a class="dropdown-item" href=" ../Logout">Log out</a>
                 
           
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>