<?php 
require_once("crud.php");

$arr = array();
$cursor = (new crud)->readForm2($_POST['pubid']);
$i=0;
foreach($cursor as $doc){
	$arr[$i] = $doc['sid'];
	$i++;
	}
	echo json_encode($arr);
?>
