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

function init_orders(){
    $arr = array();
    $arr[] = array(
      "name" => "bat",
      "quantity" => 4
    );
    $arr[] = array(
      "name" => "player",
      "quantity" => -1
    );
    return $arr;
}

function update_inventory_for_order($inventory, $order){
  for($i = 0; $i < count($order);$i++){
    $order_name = $order[$i]['name'];
    $order_quantity = $order[$i]['quantity'];
    for($j = 0;$j < count($inventory);$j++){
      if($inventory[$j]['name'] == $order_name){
        $inventory[$j]['in_stock'] += $order_quantity;
      }
    }
  }
  return $inventory;
}
?>
