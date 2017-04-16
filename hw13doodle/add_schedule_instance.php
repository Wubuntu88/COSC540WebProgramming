<?php
/*
Assignment: Display a table with AJAX
Author: William Gillespie
Date Assigned: 2017-04-13
Date Due: 2017-04-18
*/
if(isset($_POST['action']) && $_POST['action'] == "add_schedule_of_user"){
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

  $schedule_instance = $_POST['schedule_instance'];
  $username = $schedule_instance['username'];
  $time1 = $schedule_instance['time1'] == 'true' ? 1 : 0;
  $time2 = $schedule_instance['time2'] == 'true' ? 1 : 0;
  $time3 = $schedule_instance['time3'] == 'true' ? 1 : 0;
  $time4 = $schedule_instance['time4'] == 'true' ? 1 : 0;
  $time5 = $schedule_instance['time5'] == 'true' ? 1 : 0;
  $time6 = $schedule_instance['time6'] == 'true' ? 1 : 0;

  $filtered_username = filter_var($username, FILTER_SANITIZE_STRING);
  echo $filtered_username;

  $sql_username_already_exists = "SELECT * FROM schedule_instance WHERE username = '$filtered_username'";
  $result = $conn->query($sql_username_already_exists);
  if($result->num_rows == 0) {  # if there was no one with that username, create a new user.
    $sql_insert_user = "INSERT INTO schedule_instance (username, time1, time2, time3, time4, time5, time6)
      VALUES ('$filtered_username', {$time1}, {$time2}, {$time3}, {$time4}, {$time5}, {$time6})";
    if ($conn->query($sql_insert_user) === TRUE) {
      echo "success";
    }else {
      echo "failed to create username.  Error: " . $conn->error;
    }
  }else {
    echo 'username already exists';
  }


}
 ?>
