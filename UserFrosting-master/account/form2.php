 <!DOCTYPE HTML>
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>

<?php
// define variables and set to empty values
$nameErr = $platformErr = $websiteErr = "";
$name = $platform = $website = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   if (empty($_POST["name"])) {
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

   if (empty($_POST["platform"])) {
     $platformErr = "platform is required";
   } else {
     $platform = test_input($_POST["platform"]);
   }

}

function test_input($data) {
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
}
?>

<h2>PHP Form Validation Example</h2>
<p><span class="error"></span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
   Domain ID: <input type="text" name="name" value="">
   <span class="error"><?php echo $nameErr;?></span>
   <br><br>
   Platform: <input type="text" name="platform" value="">
    <span class="error"><?php echo $platformErr;?></span>
   <br><br>
  Website Domain: <input type="text" name="website" value="">
   <span class="error">*\<?php echo $websiteErr;?></span>
   <br><br>

   <input type="submit" name="submit" value="Submit">
</form>


<?php
if((empty($nameErr))&&(empty($websiteErr))&&(empty($platformErr))){
	 $m = new MongoClient();
	$db = $m->mydb;
	$collection = $db->createCollection("mycol");
	$document = array(
	       "pubid" => $_SESSION['username'], 
	       "sid" => $name, 
	      "platform" => $platform, 
	      "website" => $website,
	      'piwik'  => 2,
	      'cache' => true,
	      'allowedParameters' => array(),
	      'abtest' => false, 
	   );
	$collection->insert($document);
}
?>


<?php
echo "<h2>Your Input:</h2>";
echo $name;
echo "<br>";
echo $platform;
echo "<br>";
echo $website;
echo "<br>";
?>



</body>
</html>

