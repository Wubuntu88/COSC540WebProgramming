<?php
  /* details only in plaintext because it is a local server*/
  $servername = "localhost";
  $username = "root";
  $password = "root";
  $dbname = "hw04db";

  // Create connection
  global $conn;
  $conn = new mysqli($servername, $username, $password, $dbname);

  $sql = "SELECT id, name, cost FROM Item";
  $result = $conn->query($sql);

  $rows = array();
  while($row = $result->fetch_assoc()) {
      $rows[] = $row;
  }
  echo json_encode($rows);
 ?>
