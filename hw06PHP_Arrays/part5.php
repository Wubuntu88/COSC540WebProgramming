<?php
include('inventory_funcs.php');
echo '<h1>Original Inventory</h1>';
$inventory = init_item_array();
echo '<h3>' . json_encode($inventory) . '</h3>';
echo '<h1>Orders</h1>';
$orders = init_orders();
echo '<h3>' . json_encode($orders) . '<h3>';
echo '<h1>New Inventory</h1>';
$new_inventory = update_inventory_for_order($inventory, $orders);
echo '<h3>' . json_encode($new_inventory) . '</h3>';
 ?>
