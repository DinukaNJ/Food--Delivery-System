
<%@page import="Model.cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!doctype html>`

<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v3.8.5">
  
  <title>NSBM Online Food oderaing System </title>
  
  
  <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/sticky-footer/">
<link href="sticky-footer.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  <!-- Bootstrap core CSS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/javascript.util/0.12.12/javascript.util.min.js" integrity="sha512-oHBLR38hkpOtf4dW75gdfO7VhEKg2fsitvHZYHZjObc4BPKou2PGenyxA5ZJ8CCqWytBx5wpiSqwVEBy84b7tw==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/">
<link href="form-validation.css" rel="stylesheet">
  <style>
      .quantity {

  padding-top: 20px;
}
.quantity input {
  -webkit-appearance: none;
  border: none;
  text-align: center;
  width: 32px;
  font-size: 16px;
  color: #43484D;
  font-weight: 300;
}
 
button[class*=btnn] {
  width: 30px;
  height: 30px;
  background-color: #E1E8EE;
  border-radius: 6px;
  border: none;
  cursor: pointer;
}
.minus-btn img {
  margin-bottom: 3px;
}
.plus-btn img {
  margin-top: 2px;
}
 
button:focus,
input:focus {
  outline:0;
}
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
  
<!--    additional things remove it--> 
  <!-- Custom styles for this template -->
  <link href="album.css" rel="stylesheet">
<!--    additional things--> 


  
</head>
<body>
  <header>
      
      
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<a class="navbar-brand" href="#">Hotel</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav mr-auto">
    <li class="nav-item ">
      <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="LoadingFoods?period=false">Food</a>
    </li>
<!--      <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Dropdown
      </a>
      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" href="#">Action</a>
        <a class="dropdown-item" href="#">Another action</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#">Something else here</a>
      </div>
    </li>-->
   
  </ul>
  <form class="form-inline my-2 my-lg-0"  method="post" action="SearchLoading">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" name="search" value="" aria-label="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form>
</div>
</nav>
      
      
</header>
<!--header end-->

<%! 
    


    double total=0.0;
    int size = 0;
%>
<main role="main">
 <% 
         List<cart> customizeList = (ArrayList<cart>) request.getAttribute("cartlist");
         size = customizeList.size(); 
 %>   
    
    <!-- <small class="text-muted">/ mo</small> -->
<div class="album py-5 bg-light"></div>
<div class="container text-center">
<div class="row justify-content-center">
    <div class="col-md-8 order-md-2 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Your cart</span>
        <span class="badge badge-secondary badge-pill"><%= size %></span>
      </h4>
      <ul class="list-group mb-3">
          
          
          
        <% 
                       // String uid = (String) request.getSession().getAttribute("uid");
                        total = 0;
                       for(cart ca : customizeList){
                           
                           
                       

            %> 
           
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <img src="assets/products/<%= ca.getPid()+".jpg"%>"  style="width: 80px;">
          <div>
              <h6 class="my-0"><%= ca.getPname() %></h6>
            <small class="text-muted"><%= ca.getOdis() %></small>
          </div>
          <span class="text-muted">RS .<%= ca.getTotal() %> <a href="CustomizeServlet?itemid=<%= ca.getPid()%>">
                  
                  <button type="button" class="btn btn-sm btn-primary" >customize</button></a></span>
          <% total= total + ca.getTotal(); %>

        </li>
      
         <%} %>  
     
       
        <li class="list-group-item d-flex justify-content-between">
          <span>Total (USD)</span>
          <strong>RS <%=total %></strong>
        </li>
      </ul>

      <!-- <form class="card p-2">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Promo code">
          <div class="input-group-append">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
        </div>
      </form> -->
    </div>

    </div>
    <button type="button" class="btn btn-md btn-primary justify-content-center" >Checkuot</button>

    </div>


</main>

<footer class="footer">
    <div class="container">
      <span class="text-muted">Place sticky footer content here.</span>
    </div>
  </footer>
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
</body>
</html>

