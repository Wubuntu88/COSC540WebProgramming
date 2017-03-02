<!DOCTYPE html>
<!-- this is modified by William Gillespie-->
<!-- saved from url=(0042)http://emunix.emich.edu/~haynes/index.html -->
<html>
<head>
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>haynes&nbsp;at&nbsp;emunix&nbsp;.&nbsp;emich&nbsp;.&nbsp;edu </title>
  <!--<base href="http://emunix.emich.edu/~haynes/public_html">--><base href=".">

  <link rel="stylesheet" href="./index_files/EMUstyle2015.css" type="text/css">
  <style type="text/css">
   th, td { padding-left: 5px;
   			padding-right: 5px;
   			padding-top: 2px;
   			padding-bottom: 2px; }
  </style>

</head>

<body>
  <?php include("header.html"); ?>
<br>

<h3 align="center"> Home page for Susan Makrouhee Haynes, PhD</h3>
<hr width="50%">
<br> <br>

<table>
  <tbody><tr> <td> <table text-align="right">
  <tbody><tr> <td> <a href="http://emich.edu/compsci">Department of Computer Science</a>	</td></tr>

  <tr> <td> 511E Pray-Harrold Hall</td></tr>
  <tr> <td> <a href="http://emich.edu/">Eastern Michigan University</a></td></tr>
  <tr> <td> Ypsilanti, MI 48197														</td></tr>
  <tr> <td> shaynes at emich dot  edu	</td></tr>

  <tr> <td>v: 734-487-1063															</td></tr>
  <tr> <td>f: 734-487-6824															</td></tr>
  <tr> <td> &nbsp; </td></tr>
  <tr> <td></td> </tr>
</tbody></table>



 <hr width="75%">


<h4> Office hours <br>
     WINTER 2017 <br>
     Monday 1:00 - 3:30pm &amp; Wednesday 1:00 - 4:30pm</h4>



<hr width="75%">


<h4> Class Schedule WINTER 2017</h4>
 <table border="1" id="course_table">
   <!-- Will be filled with info on load-->
</table>

<hr width="75%">

<?php include('footer.html'); ?>

</td></tr></tbody></table></body>
<script>
/*
takes json encoded data of rows about course info and generates a string table
from it.  A string representation of a table is returned.
*/
function generate_table(json_encoded_data){
  var table_contents = "<tr> <th>Classes</th> <th> Name </th>  <th>Time</th> <th>Room</th> </tr>";
  var contents = JSON.parse(json_encoded_data);
  for(var i = 0; i < contents.length;i++){
    table_contents += "<tr> <td>" + contents[i]['course'] + "</td> <td>" +
                      contents[i]['course_name'] + "</td> <td>" +
                      contents[i]["course_time"] + "</td> <td>" +
                      contents[i]["course_room"] + "</td> </tr>";
  }
  return table_contents;
}
/*
  Makes an ajax call via Jquery to fetch the courses the susan haynes teaches.
  The innerHTML of the courses table is set when the asynchronous call finishes.
*/
function fetch_course_details() {
	$.ajax({
		method: "POST",
		url: "return_courses.php",
		data: {action: "fetch_course_details"},
		success: function(output) {
			try{
				console.log("success");
        var table_contents = generate_table(output);
        var course_detail_table = document.getElementById("course_table");
        course_detail_table.innerHTML = table_contents;
			}catch(e){
				console.log(e);
			}
		}
	});
}
/*
  Calls the fetch_course_details() method when the document has loaded.
  This will fill the table showing the courses that Susan Haynes teaches.
*/
$( document ).ready(function() {
  fetch_course_details();
});
</script>
</html>
