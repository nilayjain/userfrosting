<?php 
require_once("./admin_crud.php");

$arr = array();
$arr['renderFunc'] = (new admin_crud)->cascade_read('adminuser','edfgvfdhfh','rr','renderFunc');
$arr['html'] = (new admin_crud)->cascade_read('adminuser','edfgvfdhfh','rr','html');
$arr['css'] = (new admin_crud)->cascade_read('adminuser','edfgvfdhfh','rr','css');
	print_r($arr);
?>
