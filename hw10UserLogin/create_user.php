<?php
  /*
  Author: William Gillespie
  This php file responds to the ajax call in user_login.html and creates a user in the database.
  */
  ini_set('display_errors', 1);
  /* details only in plaintext because it is a local server*/
  $servername = "localhost";
  $username = "root";
  $password = "root";
  $dbname = "hw_10_user_login_db";

  // Create connection
  global $conn;
  $conn = new mysqli($servername, $username, $password, $dbname);

  /* check connection */
  if (mysqli_connect_errno()) {
      printf("Connect failed: %s\n", mysqli_connect_error());
      exit();
  }

  if(isset($_POST['action']) && $_POST['action'] != "") {
    $create_table_if_not_exists_sql = '
      create table if not exists user (
        id int not null auto_increment,
        user_name varchar(20) not null,
        first_name varchar(20) not null,
        last_name varchar(20) not null,
        email_address varchar(30) not null,
        password varchar(20) not null,
        primary key (id)
      )';
    $conn->query($create_table_if_not_exists_sql);

    $user_info = $_POST['data'];
    $filtered_username = filter_var($user_info['username'], FILTER_SANITIZE_STRING);
    $filtered_password = filter_var($user_info['password'], FILTER_SANITIZE_STRING);
    $filtered_firstname = filter_var($user_info['firstname'], FILTER_SANITIZE_STRING);
    $filtered_lastname = filter_var($user_info['lastname'], FILTER_SANITIZE_STRING);
    $filtered_email = filter_var($user_info['email'], FILTER_SANITIZE_STRING);

    $sql_username_already_exists = "SELECT * FROM user WHERE user_name = '$filtered_username'";
    $result = $conn->query($sql_username_already_exists);

    if($result->num_rows == 0) {  # if there was no one with that username, create a new user.
      $sql_insert_user = "INSERT INTO user (user_name, first_name, last_name, email_address, password) VALUES ('$filtered_username', '$filtered_firstname', '$filtered_lastname', '$filtered_email', '$filtered_password')";
      if ($conn->query($sql_insert_user) === TRUE) {
        echo "username successfully created!";
      }else {
        echo "failed to create username.  Error: " . $conn->error;
      }
    }else {
      echo 'username already exists';
    }

  }
 ?>
