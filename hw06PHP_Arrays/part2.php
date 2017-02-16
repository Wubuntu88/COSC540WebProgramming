<?php
/*
Author: William  Gillespie
URL:
*/
include('inventory_funcs.php');

function value_for_stock($inventory_item) {
  return array($inventory_item['name'], $inventory_item['in_stock'] * $inventory_item['per_item_cost']);
}

$item_array = init_item_array();

$item_stock_values = array_map("value_for_stock", $item_array);

$arr_hashmap = array();
foreach($item_stock_values as $name_value){
  $arr_hashmap[$name_value[0]] = $name_value[1];
}

echo json_encode($arr_hashmap);


 ?>
