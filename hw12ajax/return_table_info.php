<?php
/*
Assignment: Display a table with AJAX
Author: William Gillespie
Date Assigned: 2017-04-11
Date Due: 2017-04-13
*/
if(isset($_POST['action']) && $_POST['action'] == "fetch_item_details"){
  ini_set('display_errors', 1);
  /* details only in plaintext because it is a local server*/
  $servername = "localhost";
  $username = "root";
  $password = "root";
  $dbname = "hw04db";

  // Create connection
  global $conn;
  $conn = new mysqli($servername, $username, $password, $dbname);
  /* check connection */
  if (mysqli_connect_errno()) {
      printf("Connect failed: %s\n", mysqli_connect_error());
      exit();
  }

  $sql = "SELECT id, name, cost FROM Item";
  $result = $conn->query($sql);
  $rows = array();
  while($row = $result->fetch_assoc()) {
      $rows[] = $row;
  }
  echo json_encode($rows);
}
 ?>
