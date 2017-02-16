<?php
/*
Author: William  Gillespie
URL: http://people.emich.edu/wgilles1/hw06PHP_Arrays/part3.php
*/
include('part3_cards_functions.php');

$deck = init_deck();
$hands = create_hands($deck);
echo json_encode($hands);
 ?>
