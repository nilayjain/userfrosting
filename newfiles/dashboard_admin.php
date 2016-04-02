<?php

// UserCake authentication
require_once("../models/config.php");
	require_once("./crud.php");
	require_once("./widget.php");
// Request method: GET
$ajax = checkRequestMode("get");

if (!securePage(__FILE__)){
    apiReturnError($ajax);
}


setReferralPage(getAbsoluteDocumentPath(__FILE__));

// Admin page
?>
<!DOCTYPE html>
<html lang="en">
  <?php
  	echo renderAccountPageHeader(array("#SITE_ROOT#" => SITE_ROOT, "#SITE_TITLE#" => SITE_TITLE, "#PAGE_TITLE#" => "Admin Dashboard"));
  ?>
<head>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
  
<!-- include jquery library -->
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>
  
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>

<script>
function callthis(arg,arg1,arg2){
	//  alert(arg);
       $.post("dashboardAjax.php",
        {
         pubid: arg1,
         sid: arg2
        },
      
        function(data,status){
        	//var myObj = $.parseJSON(data);
        	document.getElementById(arg).innerHTML = data;
        	if(data=="Enabled"){
        		document.getElementById(arg).classList.remove('btn-danger');
        		document.getElementById(arg).classList.add('btn-success');
        	}else{
        		document.getElementById(arg).classList.remove('btn-success');
        		document.getElementById(arg).classList.add('btn-danger');
					}
        	 
        });
    //    $("#".concat(arg)).remove
}

</script>

  <body>    
    <div id="wrapper">

      <!-- Sidebar -->
        <?php
            echo renderMenu("dashboard-admin");
        ?>

     <div id="page-wrapper">
	  	<div class="row">
          <div id='display-alerts' class="col-lg-12">
          
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <h1>Dashboard <small>User Overview</small></h1>
            <ol class="breadcrumb">
              <li class="active"><i class="fa fa-dashboard"></i> Dashboard</li>
            </ol>
            
              <h2 class="sub-header">Section title</h2>
          <div class="table-responsive">
            <table id ="mahtable" class="table table-striped">
              <thead>
                <tr>
                  <th>Serial No.</th>
                  <th>Publisher ID</th>
                  <th>Secondary ID</th>
                  <th>Website</th>
                  <th>Widget(s)</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
              <?php
              	$show = new crud();
              	$info = $show->read();
              	$i = 1;
              	foreach($info as $doc){
              		echo "<tr>
              		<td>".$i++."</td>
                  <td>".$doc['pubid']."</td>
                  <td>".$doc['sid']."</td>
                  <td>".$doc['website']."</td>";
                  $cursor = $show->readWidgets($doc['pubid'],$doc['sid']);
              	foreach($cursor as $doc2){
              		$x = 0;
              		echo "<td>";
              		for($x = 0;$x < count($doc2['widget']);$x++){
              				echo $doc2['widget'][$x]. " ";	
              		}
              			echo "</td>";
              	}
              	$arg1=$doc['pubid'];
              	$arg2=$doc['sid'];
              	$arg = $arg1.$arg2;
              	if($doc['status']=="Enabled") $btnclass = 'btn-success';
              	else $btnclass = 'btn-danger';
  								echo "<td><button class='btn $btnclass' name='submit' id=".$arg." onclick=" . "callthis('$arg','$arg1','$arg2');>".$doc['status']."</button></td> ";	              
                echo "</tr>";
              	}
              ?>                
              </tbody>
            </table>    
            </div>
          </div>
          
          <div class="row">
          <div id='widget-users' class="col-lg-12">          

          </div>
        </div><!-- /.row -->
		
      </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->
    
    <script src="../js/raphael/2.1.0/raphael-min.js"></script>
    <script src="../js/morris/morris-0.4.3.js"></script>
    <script src="../js/morris/chart-data-morris.js"></script>
    <script>
       /* $(document).ready(function() {          
          alertWidget('display-alerts');
          
          // Initialize the transactions tablesorter
          $('#transactions .table').tablesorter({
              debug: false
          });
          
        });*/
	$(document).ready( function () {
    $('#mahtable').DataTable();
} );      
    </script>
  </body>
</html>
