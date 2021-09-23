<?php
$tomorrow = date("Y-m-d", strtotime('tomorrow'));

$tomorrow = date("Y-m-d", strtotime("+1 day"));

//for DateTime
  
$datetime = new DateTime('tomorrow');
echo $datetime->format('Y-m-d H:i:s');

echo "</br>";

$datetime = new DateTime('2013-01-22');
$datetime->modify('+1 day');
echo $datetime->format('Y-m-d H:i:s');



echo "</br>";
$myd='2021-08-10';
$datetime = new DateTime($myd);
$datetime->modify('+1 day');
echo $datetime->format('Y-m-d ');
?>