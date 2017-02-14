<?php
include('part3_cards_functions.php');
$deck = init_deck();
$number_of_cards_to_draw = 20;
$random_cards = array_rand($deck, $number_of_cards_to_draw);
echo "as you can see, the array_rand() function samples without replacement: ";
echo json_encode($random_cards);
 ?>
