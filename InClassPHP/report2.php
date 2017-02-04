<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    echo "<h2>THANKS FOR SUBMITTING THE FORM</h2>";
    // collect value of input field
    if (empty($_REQUEST['whenithappened'])) {
      echo "<p>when: unknown</p>";
    } else {
      $when = $_REQUEST['whenithappened'];
      echo "<p>when: " . $when . "</p>";
    }

    if(empty($_REQUEST['whenithappened'])) {
      echo "<p>your description: unknown</p>";
    }else {
      $description = $_REQUEST['description'];
      echo "<p>your description: " . $description . "</p>";
    }


    if (empty($_REQUEST['awake'])) {
      echo "<p>awake: unknown<p>";
    } else {
      $awake = $_REQUEST['awake'];
      echo "<p>awake: " . $awake . "<p>";
    }

}
?>
