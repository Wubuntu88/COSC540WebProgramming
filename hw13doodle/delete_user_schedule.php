<?php
/*
Assignment: Display a table with AJAX
Author: William Gillespie
Date Assigned: 2017-04-13
Date Due: 2017-04-18
*/
if(isset($_POST['action']) && $_POST['action'] == "delete_schedule_of_user"){
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

  $username = $_POST['user_to_delete'];

  $filtered_username = filter_var($username, FILTER_SANITIZE_STRING);
  echo $filtered_username;

  $sql_username_already_exists = "SELECT * FROM schedule_instance WHERE username = '$filtered_username'";
  $result = $conn->query($sql_username_already_exists);
  if($result->num_rows > 0) {  # if there was no one with that username, create a new user.
    $sql_delete_user = "DELETE FROM schedule_instance WHERE username = '$filtered_username'";
    if ($conn->query($sql_delete_user) === TRUE) {
      echo "success";
    }else {
      echo "failed to delete user schedule.  Error: " . $conn->error;
    }
  }else {
    echo 'username does not exist';
  }


}
 ?>
