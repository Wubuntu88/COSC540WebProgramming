
<!-- saved from url=(0047)http://people.emich.edu/shaynes/436/report.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
  <title>title of html page</title>
</head>

<body>
<p> share your story </p>

<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>"
  <label for="whenithappened">When did it happen? </label>
  <input type="text" id="whenithappened" name="whenithappened"> <br>

  <label for="description"> Describe it </label>
  <input type="text" id="description" name="description"> <br>

  <p>
  <label for="awake">Are you awake?</label> <br>
  Yes <input id="awake" name="awake" type="radio" value="yes">
  No <input id="awake" name="awake" type="radio" value="no"> <br>
  <input type="submit" value="report it" name="submit">
  </p>

</form>

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

</body>
</html>
