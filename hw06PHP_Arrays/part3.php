<?php
/*
Author: William  Gillespie
*/
include('part3_cards_functions.php');

$deck = init_deck();
$hands = create_hands($deck);
echo json_encode($hands);
 ?>
