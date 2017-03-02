<?php
# loads the course info file, loops through the lines, evaluates if the instructor is Susan Haynes.
# If it is Susan, Json encoded rows about course, course_name, course_time, and course_room are echoed.
if(isset($_POST['action']) && $_POST['action'] == "fetch_course_details")
{
  $content = file_get_contents('http://it.emich.edu/bannerfiles/sctnenrl_wi.txt');
  $lines = explode("\n", $content);

  $rows = array();
  foreach ($lines as $line) {
    $components = explode(";", $line);
    # name is at index 28
    if(count($components) > 28 && preg_match("/Haynes,Susan.*/", $components[28], $match)){
      $course = $components[4] . " " . $components[5];
      $course_name = $components[9];
      $course_time = $components[20] . $components[21] . $components[22] . $components[23] .
                      $components[24] . $components[25];
      $course_time = trim($course_time);
      $course_time .= " " . $components[17] . " - " . $components[18];
      $course_room = $components[27] . " "  . $components[26];

      $row =  array('course' => $course,
                    'course_name' => $course_name,
                    'course_time' => $course_time,
                    'course_room' => $course_room);
      $rows[] = $row;
    }
  }
  echo json_encode($rows);
}
 ?>
