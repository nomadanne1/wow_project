<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <ul class="nav navbar-nav">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">이웃의 솜씨<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">종로구 명동</a></li>
          <li><a href="#">종로구 을지로1동</a></li>
        </ul>
      </li>
      </ul>
    </div>
  
        <ul class="nav navbar-nav">
          <li class="active">
               <form class="navbar-form navbar-left" action="/action_page.php">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search" name="search">
                  <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                      <i class="glyphicon glyphicon-search"></i>
                    </button>
                  </div>
                </div>
              </form>
          </li>
        </ul>
  
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">HOME</a></li>
        <li><a href="#">LOGIN</a></li>
        <li><a href="#">MY PAGE</a></li>
      </ul>
    </div>
  </div>
</nav>