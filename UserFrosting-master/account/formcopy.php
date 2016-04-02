<?php
require_once("../models/config.php");
/*
// Request method: GET
$ajax = checkRequestMode("get");

if (!securePage(__FILE__)){
    apiReturnError($ajax);
}

setReferralPage(getAbsoluteDocumentPath(__FILE__));
*/
?>
<?php
// define variables and set to empty values
$nameErr = $websiteErr = $mpErr = $widgetErr= "";
$name = $website = $mp = $widget = "";
$aw = $rr = $awcom = NULL;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
/*sid*/   if (empty($_POST["name"])) {
     $nameErr = "Name is required";
   } else {
     $name = test_input($_POST["name"]);
     // check if name only contains letters and whitespace
     if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
       $nameErr = "Only letters and white space allowed";
     }
   }
  
   if (empty($_POST["website"])) {
     $websiteErr = "website is required";
   } else {
     $website = test_input($_POST["website"]);
     // check if URL address syntax is valid (this regular expression also allows dashes in the URL)
     if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$website)) {    
	$websiteErr = "Invalid URL";
     }
   }

   if (empty($_POST["mp"])) {
     $mpErr = "match paramter is required";
   } else {
     $mp = test_input($_POST["mp"]);
   }
   
   if (empty($_POST["aw"]) && empty($_POST["rr"]) && empty($_POST["awcom"])) {
     $widgetErr = "please select atleast one widget";
   } else {
     $aw = $_POST["aw"];
     $rr = $_POST["rr"];
     $awcom = $_POST["awcom"];
   }
}

function test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
}
?>
<!DOCTYPE html>
<html lang="en">
  <?php
  	echo renderAccountPageHeader(array("#SITE_ROOT#" => SITE_ROOT, "#SITE_TITLE#" => SITE_TITLE, "#PAGE_TITLE#" => "Account Settings"));
  ?>

  <body>
    <div id="wrapper">

      <!-- Sidebar -->
        <?php
          echo renderMenu("settings");
        ?>  

      	<div id="page-wrapper">
	  			<div class="row">
          	<div id='display-alerts' class="col-lg-12">

          	</div>
        	</div>
        	<h1>User Form</h1>
        	<p class="lead">Use this form to add your requirements and customizations.<br></p>
        	<div class="row">
		  			<div class="col-lg-6">
		  			<form class="form-horizontal" role="form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" >
		<div class="form-group">
    <label class="control-label col-sm-4" for="sid">Domain ID:</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="sid" name="name" placeholder="Enter Domain ID">
      <span class="error"><?php echo $nameErr;?></span>
    </div>
  </div>
  
	<div class="form-group">
    <label class="control-label col-sm-4" for="mp">Match Parameter:</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="mp" name="mp" placeholder="Enter Match Parameter">
      <span class="error"><?php echo $mpErr;?></span>
    </div>
  </div>

	<div class="form-group">
    <label class="control-label col-sm-4" for="website">Website URL:</label>
    <div class="col-sm-8">
      <input type="url" class="form-control" id="website" name="website" placeholder="Enter url">
      <span class="error"><?php echo $websiteErr;?></span>
    </div>
  </div>

   <div class="form-group"> 
    <div class="col-sm-offset-4 col-sm-8">
      <button type="submit" class="btn btn-lg btn-primary" name="submit" value="Submit">Submit</button>
    </div>
  </div>
  </form>
  </div>
		</div>
	  </div>
	</div>
	
<?php
if((empty($nameErr))&&(empty($websiteErr))&&(empty($mpErr))&&(!empty($name))&&(!empty($website))&&(!empty($mp))){
	 $m = new MongoClient();
	$db = $m->mydb;
	$collection = $db->createCollection("mycol");
	$document = array(
	       "pubid" => $_SESSION['username'], 
	       "sid" => $name, 
	      "website" => $website,
	      "mp" => $mp,
	      "widgets" => array(
	      		"rr" => $rr,
			"aw" => $aw,
			"awcom" => $awcom),
	      'piwik'  => 2,
	      'cache' => true,
	      'allowedParameters' => array(),
	      'abtest' => false, 
	   );
	$collection->insert($document);
	$message = "Data inserted successfully";
echo "<script type='text/javascript'>alert('$message');</script>";
}
?>
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->


</body>
</html>

