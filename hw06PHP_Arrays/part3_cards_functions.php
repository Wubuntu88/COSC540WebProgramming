<?php
/*
Author: William  Gillespie
This code has the hellper functions for the Eucher hands assignment. 
*/
function init_deck(){
  $arr = array();
  for($i = 0; $i < 52;$i++) {
    $arr[] = $i;
  }
  return $arr;
}

function faces(){
  return array('A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K');
}

function suits(){
  return array('H', 'D', 'S', 'C');
}

function card_for_number($number) {
  if($number >=0 && $number <=51){
    return faces()[$number % 13] . suits()[$number / 13];
  }else{
    return null;
  }
}

function create_hands($deck) {
  $cards_per_hand = 5;
  $number_of_hands = 4;
  $number_of_cards_to_draw = $cards_per_hand * $number_of_hands;
  $random_cards = array_rand($deck, $number_of_cards_to_draw);
  shuffle($random_cards);

  $random_cards_as_strings = array_map('card_for_number', $random_cards);

  $hands = array();
  for($i = 0; $i < $number_of_hands;$i++){
    $start_index = $i*$cards_per_hand;
    $hands[] = array_slice($random_cards_as_strings, $start_index, $cards_per_hand);
  }
  return $hands;
}
 ?>
