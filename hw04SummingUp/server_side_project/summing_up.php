<!--
Author: William Gillespie
Course: COSC 540
Assignment: Homework 1 (Search and Replace)
  Assigned: 2017/01/05
  Due: 2017/01/12
Semester: Winter 2017
-->
<? php
  session_start();
  #include("mysql_connect.php");
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Client Side Summing Up</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- I found the following imports from w3schools http://www.w3schools.com/bootstrap/bootstrap_get_started.asp -->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#d3d3d3;">
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <div class="navbar-brand">Pretend Like You're Buying Stuff </div>
        <div class="navbar-brand"><span class="glyphicon glyphicon-gift"></span></div>
      </div>
    </div>
  </nav>
  <div class="container-fluid">
    <form id="make_purchase_form">
      <!-- to be filled in by script -->
    <form>
  </div>

  <!-- div container for holding the invoice-->
  <div class="container-fluid" id="invoice">
    <!-- to be filled in by script-->
  </div>
</body>
<script>
  $("#make_purchase_form").on('submit', function (e) {
     //get prices of items
     var prices_tags = document.getElementsByClassName("item_price");
     var item_prices = []
     for(p of prices_tags){
       item_prices.push(parseInt(p.innerHTML));
     }

     //get names of items
     names_tags = document.getElementsByClassName("item_name");
     item_names = [];
     for(n of names_tags){
       item_names.push(n.innerHTML);
     }

     quantity_tags = document.getElementsByClassName("form-control item_quantity");
     item_quantities = [];
     for(q of quantity_tags){
       item_quantities.push(q.value);
     }

     var json = JSON.stringify([item_prices, item_names, item_quantities]);
     //send data to server
     $.ajax({
   		method: "POST",
   		url: "process_order.php",
   		data: {action: "send_purchase",
              data:json},
   		success: function(output) {
   			try{
          //do the table display
          $("#invoice").html(output);
   			}catch(e){
   				console.log("error:" . e);
   			}
   		}
   	});
     //stop form submission because it will erase the form data
     e.preventDefault();
  });


  function fetch_rows_and_fill_table() {
  	$.ajax({
  		method: "POST",
  		url: "return_rows.php",
  		data: {action: "fetch_items"},
  		success: function(output) {
  			try{
  				var rows = JSON.parse(output);
          table_row_string = generate_table_contents(rows);
          $("#make_purchase_form").html(table_row_string);
  			}catch(e){
  				console.log("error:" . e);
  			}
  		}
  	});
}
fetch_rows_and_fill_table();

function generate_table_contents(array_of_items){
  var table_contents_array = [];
  table_contents_array.push("<table border='3' class='table table-striped' id='form_table'>");
  table_contents_array.push("<tr><th>ID</th><th>Item</th><th>Cost Per Item</th><th>Quantity Ordered</th></tr>");
  for(item of array_of_items){
    var id = item.id;
    var name = item.name;
    var cost = item.cost;
    var s = "<tr>\
              <td>" + id + "</td>\
              <td class=\"item_name\">" + name + "</td>\
              <td class=\"item_price\">" + cost + "</td>\
              <td>\
                <select class=\"form-control item_quantity\" id=\"pen_order_quantity\">\
                  <option>0</option>\
                  <option>1</option>\
                  <option>2</option>\
                  <option>3</option>\
                  <option>4</option>\
                </select>\
              </td>\
            </tr>";
    table_contents_array.push(s);
  }
  table_contents_array.push("</table>")
  table_contents_array.push("<button type='submit' class='btn btn-default pull-right'>Calculate Order</button>")
  return table_contents_array.join("");
}

</script>
</html>
