<?php
/*
Assignment: Display a table with AJAX
Author: William Gillespie
Date Assigned: 2017-04-13
Date Due: 2017-04-18
*/
if(isset($_POST['action']) && $_POST['action'] == "fetch_schedule_details"){
  ini_set('display_errors', 1);
  /* details only in plaintext because it is a local server*/
  $servername = "localhost";
  $username = "root";
  $password = "root";
  $dbname = "doodle_db";
  // Create connection
  global $conn;
  $conn = new mysqli($servername, $username, $password, $dbname);
  /* check connection */
  if (mysqli_connect_errno()) {
      printf("Connect failed: %s\n", mysqli_connect_error());
      exit();
  }
  $sql = "SELECT * FROM schedule_instance";
  $result = $conn->query($sql);
  if ($result->num_rows == 0) {
    $sql_get_col_names = 'SHOW COLUMNS FROM schedule_instance';
    $col_names_result = $conn->query($sql_get_col_names);
    $col_names_arr = array();
    while($row = $col_names_result->fetch_assoc()) {
        $col_names_arr[] = $row['Field'];
    }

    echo json_encode(array('header' => $col_names_arr));
  }else{
    $rows = array();
    while($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }
    echo json_encode($rows);
  }
}
 ?>
