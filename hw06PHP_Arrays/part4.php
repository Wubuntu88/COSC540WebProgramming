<?php
/*
Author: William  Gillespie
URL: http://people.emich.edu/wgilles1/hw06PHP_Arrays/part4.php
*/
include('part3_cards_functions.php');
$deck = init_deck();
$number_of_cards_to_draw = 20;
$random_cards = array_rand($deck, $number_of_cards_to_draw);
echo "as you can see, the array_rand() function samples without replacement: ";
echo json_encode($random_cards);
 ?>
