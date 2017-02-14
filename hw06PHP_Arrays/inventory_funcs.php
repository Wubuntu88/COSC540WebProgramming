<?php
function init_item_array(){
  $array = array();
  $array[] = array(
    "name" => "bat",
    "in_stock" => 5,
    "per_item_cost" => 3.5
  );
  $array[] = array(
    "name" => "ball",
    "in_stock" => 4,
    "per_item_cost" => 0.5
  );
  $array[] = array(
    "name" => "base",
    "in_stock" => 3,
    "per_item_cost" => 5.0
  );
  $array[] = array(
    "name" => "umpire",
    "in_stock" => 2,
    "per_item_cost" => 10000.0
  );
  $array[] = array(
    "name" => "player",
    "in_stock" => 4,
    "per_item_cost" => 5000.0
  );
  return $array;
}
 ?>
