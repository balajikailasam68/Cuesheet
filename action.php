<?php
include('Employee.php');
$emp = new Employee();
if(!empty($_POST['action']) && $_POST['action'] == 'listEmployee') {
	$emp->employeeList();
	//$emp->loademployeeList();
}
if(!empty($_POST['action']) && $_POST['action'] == 'listmedia') {
	$emp->listmedia();
	//$emp->loademployeeList();
}
if(!empty($_POST['action']) && $_POST['action'] == 'loadlistEmployee') {
	$emp->loademployeeList();
}
if(!empty($_POST['action']) && $_POST['action'] == 'addEmployee') {
	$emp->addEmployee();
}
if(!empty($_POST['action']) && $_POST['action'] == 'addEmployeenew') {
	$emp->addEmployee();
}
if(!empty($_POST['action']) && $_POST['action'] == 'getEmployee') {
	$emp->getEmployee();
}
if(!empty($_POST['action']) && $_POST['action'] == 'updateEmployee') {
	$emp->updateEmployee();
}
if(!empty($_POST['action']) && $_POST['action'] == 'updateoverrun') {
	$emp->updateoverrun();
}
if(!empty($_POST['action']) && $_POST['action'] == 'empDelete') {
	$emp->deleteEmployee();
}
if(!empty($_POST['action']) && $_POST['action'] == 'recalculate') {
	$emp->recalculate();
}
if(!empty($_POST['action']) && $_POST['action'] == 'statuscheck') {
	$emp->statuscheck();
}
if(!empty($_POST['action']) && $_POST['action'] == 'loadnews') {
	$emp->loadNewsdata();
}
if(!empty($_POST['action']) && $_POST['action'] == 'loadmontage') {
	$emp->loadMontagedata();
}
if(!empty($_POST['action']) && $_POST['action'] == 'addrowofnews') {
	$emp->addNewsrow();
}
if(!empty($_POST['action']) && $_POST['action'] == 'addrowofmontage') {
	$emp->addMontagerow();
}
if(!empty($_POST['action']) && $_POST['action'] == 'getNewsvalues') {
	$emp->getNewsvalues();
	}
if(!empty($_POST['action']) && $_POST['action'] == 'getMontagevalues') {
	$emp->getMontagevalues();
	}
if(!empty($_POST['action']) && $_POST['action'] == 'updateInOut') {
	$emp->updateInOut();
	}
?>