<?php
require_once("/models/config.php");
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Starter Template for Bootstrap</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="form_template.css" rel="stylesheet">


    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <div class="form_template">
        <h1>Bootstrap starter template</h1>
        <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
    <form name='newUser' class='form-horizontal' id='newUser' role='form' action='api/create_user.php' method='post'>
		  <div class='row'>
			<div id='display-alerts' class='col-lg-12'>
		  
			</div>
		  </div>		
		  <div class='row'>
			<div class='col-sm-12'>
                {{user_name}}
            </div>
		  </div>
		  <div class='row'>
            <div class='col-sm-12'>
                {{display_name}}
            </div>
		  </div>
		  <div class='row'>
			<div class='col-sm-12'>
                {{email}}
            </div>
		  </div>		  
		  <div class='row'>
            <div class='col-sm-12'>
                {{password}}
            </div>
		  </div>
		  <div class='row'>
            <div class='col-sm-12'>
                {{passwordc}}
            </div>
		  </div>
		  <div class='row'>
            <div class='col-sm-12'>
                {{captcha}}
            </div>
          </div>
          <div class='form-group'>
            <div class='col-sm-12'>
                <img src='$captcha' id='captcha'>
            </div>
		  </div>
		  <br>
		  <div class='form-group'>
			<div class='col-sm-12'>
			  <button type='submit' class='btn btn-success submit' value='Register'>Register</button>
			</div>
		  </div>
          <div class='collapse'>
            <label>Spiderbro: Don't change me bro, I'm tryin'a catch some flies!</label>
            <input name='spiderbro' id='spiderbro' value='http://'/>
          </div>          
		</form>"
      </div>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

