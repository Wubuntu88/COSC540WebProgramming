<?php
/*
Author: William  Gillespie
URL: http://people.emich.edu/wgilles1/hw06PHP_Arrays/part1.php
*/

//includes the method that initilized the array of hashmaps.
include('inventory_funcs.php');

$number_of_items = 0;
$total_cost_of_items = 0;

function calculate_number_of_items($inventory) {
  $GLOBALS['number_of_items'] += $inventory['in_stock'];
}

function calculate_cost($inventory) {
  $GLOBALS['total_cost_of_items'] += $inventory['in_stock'] * $inventory['per_item_cost'];
}

$item_array = init_item_array();

array_walk($item_array, 'calculate_number_of_items');
array_walk($item_array, 'calculate_cost');

$result = array(
  "number_of_items" => $GLOBALS['number_of_items'],
  "total_cost_of_items" => $GLOBALS['total_cost_of_items']
);
echo "<h1>the array of items in JSON format</h1>";
echo "<h3>" . json_encode($item_array) . "<h3>";
echo "<h1>the number of items and the total cost of everything in JSON format</h1>";
echo "<h3>" . json_encode($result) . "<h3>";

?>
