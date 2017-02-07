<?php
/*
This script accepts a request from the a client that has defined an 'action'
and has 'data' on an order.  This script calcuates the order and sends back
an invoice table.
*/
  session_start();
  if(isset($_POST['action']) && $_POST['action'] != "")
  {
    //now I have to generate a 'receipt' or something
    $the_data = json_decode($_POST['data']);
    $rows_for_invoice = array();

    $price_index = 0;
    $name_index = 1;
    $quantity_index = 2;
    $total = 0;
    //0:prices, 1:names, 2:quatities
    $table = "<table border='3' class='table table-striped'>";
    $table .= "<caption>Invoice</caption>";
    $table .= "<tr><th>Item</th><th>Cost Per Item</th><th>Quantity Ordered</th><th>Total</th></tr>";
    for($i = 0; $i < count($the_data[0]); $i++){
      if($the_data[$quantity_index][$i] > 0){

        $item = $the_data[$name_index][$i];
        $quantity = $the_data[$quantity_index][$i];
        $price = $the_data[$price_index][$i];

        $row_total = $price * $quantity;
        $total = $total + $row_total;

        $table .= "<tr><td>{$item}</td><td>{$price}</td><td>{$quantity}</td><td>{$row_total}</td></tr>";
      }
    }
    $string_hex_color = "#7da3a3";
    $table .= "<tr><td></td><td></td><td style='background-color:{$string_hex_color}''>Grand Total</td><td style='background-color:{$string_hex_color}'>{$total}</td></tr>";
    $table .= "</table>";
    echo $table;
  }
?>
