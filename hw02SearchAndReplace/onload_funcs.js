/*
  Global variable declared:
  name: description
  file: the file object whose contents fill the text area
  initSearchFunc: a function that starts a search and highlights text
*/

$( document ).ready(function() {
  var fileInput = document.getElementById('fileInputField');

  var fillTextArea = function(evt) {  //for loading the pre element with text
    file = fileInput.files[0];
    var textType = /text.*/;

    if (file.type.match(textType)) {
    	var fileReader = new FileReader();

    	fileReader.onload = function(e) {
        var textArea = document.getElementById('user_text');
        var paragraphsInText = fileReader.result.split("\n");
        for(var i = 0; i < paragraphsInText.length; i++) {
          var wordsInParagraph = paragraphsInText[i].split(" ");
          for(var j = 0; j < wordsInParagraph.length; j++) {
            if (j == wordsInParagraph.length - 1) {
              textArea.innerHTML +=
                  "<span class=\"spans\">" + wordsInParagraph[j] + "\n</span>";
            }else {
              textArea.innerHTML +=
                  "<span class=\"spans\">" + wordsInParagraph[j] + " </span>";
            }
          }
        }
    	}

    	fileReader.readAsText(file);
    }else {
    	textArea.innerHTML = "Unable to load file; incompatible file type.  " +
                            "Only text files are supported.";
    }
  }
  //now the text area will be filled when the file input value changes
  fileInput.addEventListener('change', fillTextArea);

  /*
    Adding Event Listener for searching for strings
  */

  //color constants used for highlighting text
  var RED_HIGHLIGHT = "#ffb7b7";
  var YELLOW_HIGHLIGHT = "#fff2a8";

  // last search string for when the user clicked the search button
  var searchString = null;

  /*
    Searches the spans containing the words and checks to see if any one matches
    If there is a match, it will set the class name to 'spans colored' and
    will color the matching spans a light red color.
    If there had been a previous search, it will reset all of the spans
    Input: a string that the user is searching for
    External variables that it modifies: indexOfCurrentSearch
  */
  initSearchFunc = function(strToFind){
    indexOfCurrentSearch = -1;
    var spansToHighlight = document.getElementsByClassName("spans");
    if ( (searchString == null || strToFind != searchString) &&
          strToFind != "") {//if condition maybe bad
      //if there was a previous search term, we remove the 'colored' class
      //and reset the previously serched terms' background color to transparent
      $( "span" ).removeClass("colored");
      $(".spans").css("background-color", "transparent");

      //We find all words that match the search string; they can have . or ,
      //following them.  We then highlight the spans containing those words red
      //and set their class to 'spans colored'
      var similar_strings = [];
      var start_regex_string = "^";
      var end_regex_string = "[.,]{0,1}\\s*$";

      //We will create a search feature that excepts partial matches.
      //the first kind of match is when a character is dropper from the search.
      //the second kind of match is when two contiguous characters are swapped.

      //let's start creating the strings with the dropped characters.
      for (var i = 0; i < strToFind.length; i++) {
        var outer_cutlet = strToFind.substring(0, i) +
                            strToFind.substring(i + 1, strToFind.length);
        similar_strings.push(outer_cutlet);
      }

      //now let's create the strings with the contiguous characters swapped
      for (var i = 0; i < strToFind.length - 1 && strToFind.length >= 2; i++) {
        var beginning = strToFind.substring(0, i);
        var firstInSwap = strToFind.substring(i, i + 1);
        var secondInSwap = strToFind.substring(i + 1, i + 2);
        var ending = strToFind.substring(i + 2, strToFind.length);
        similar_strings.push(beginning + secondInSwap + firstInSwap + ending);
      }
      //first regex is for a "perfect" match
      searchString = strToFind;
      var re = new RegExp("^" + strToFind + "[.,]{0,1}\\s*$");

      $(".spans").css("background-color", "transparent");
      for (var i = 0; i < spansToHighlight.length; i++) {
        var word = spansToHighlight[i].innerHTML;
        var match = re.exec(word);
        if (match != null) {
          spansToHighlight[i].className = "spans colored";
          spansToHighlight[i].style.backgroundColor = RED_HIGHLIGHT;
          // if we found a perfect match, continue to the next word
          continue;  // and don't try to match the partially matching regexes
        }

        for (let str of similar_strings) {
          //regex representing a string that is 'similar' to searchString
          var regex = new RegExp("^" + str + "[.,]{0,1}\\s*$");
          var a_match = regex.exec(word);
          if (a_match != null) {
            spansToHighlight[i].className = "spans colored";
            spansToHighlight[i].style.backgroundColor = RED_HIGHLIGHT;
            break;  // break out and go to next word of text in outer for loop
          }
        }
      }
    }
  }

  //makes it so the initSearchFunc is called when user clicks search button
  var searchButton = document.getElementById("search_button");
  searchButton.addEventListener('click', function() {
    var searchText = document.getElementById("search_input").value;
    initSearchFunc(searchText);
  });

  /*
    'Goes to' the next search button.  Increment the 'indexOfCurrentSearch'
    variable, highlights the next term yellow, sets the 'previously' yellow
    highlighted element back to red.
  */
  var indexOfCurrentSearch = -1;
  var gotoNextSearchItem = function() {
    if (searchString != null) {
      var spansToHighlight = document.getElementsByClassName("spans colored");
      indexOfCurrentSearch =
                        (indexOfCurrentSearch + 1) % spansToHighlight.length;
      spansToHighlight[indexOfCurrentSearch].style.backgroundColor =
                                                              YELLOW_HIGHLIGHT;
      if (spansToHighlight.length > 1) {
        var prevIndex = indexOfCurrentSearch == 0 ?
                        spansToHighlight.length - 1 : indexOfCurrentSearch - 1;
        spansToHighlight[prevIndex].style.backgroundColor = RED_HIGHLIGHT;
      }
    }
  }

  var nextButton = document.getElementById("next_button");
  nextButton.addEventListener('click', function() {
    gotoNextSearchItem();
  })

  /*
    Performs similarly to the gotoNextSearchItem, except that this one
    does it in reverse.
  */
  var gotoPreviousSearchItem = function() {
    if (searchString != null) {
      var spansToHighlight = document.getElementsByClassName("spans colored");
      //if the user has not clicked the next button and no term is yellow
      if (indexOfCurrentSearch == -1 || indexOfCurrentSearch == 0) {
        indexOfCurrentSearch = spansToHighlight.length - 1;
      }else {
        indexOfCurrentSearch--;
      }
      spansToHighlight[indexOfCurrentSearch].style.backgroundColor =
                                                              YELLOW_HIGHLIGHT;
      if (spansToHighlight.length > 1) {
        var prevIndex = indexOfCurrentSearch == spansToHighlight.length - 1 ?
                                                  0 : indexOfCurrentSearch + 1;
        spansToHighlight[prevIndex].style.backgroundColor = RED_HIGHLIGHT;
      }
    }
  }

  var previousButton = document.getElementById("previous_button");
  previousButton.addEventListener('click', function() {
    gotoPreviousSearchItem();
  })

  /*
    Matches the currently selected string with the replace string.
    This will replace only the text that matches with a regex;
    If the text in the span has some trailing text that does not match with
    the replace string (such as a . or ,), then that punctuation will
    not be replaced.
    Note: this only replaces the currently selected string (i.e. the one that
    is highlighted in yellow).
  */
  var replaceSelectedItemWithString = function(replaceString) {
    if (indexOfCurrentSearch == -1) { //if the user has not selected anything
      return;  // do not replace anything if nothing is selected
    }else {
      var spansToHighlight = document.getElementsByClassName("spans colored");
      var textInSpan = spansToHighlight[indexOfCurrentSearch].innerHTML;
      var replacedText = textInSpan.replace(searchString, replaceString);
      spansToHighlight[indexOfCurrentSearch].innerHTML = replacedText;
    }
  }

  var replaceButton = document.getElementById("replace_button");
  replaceButton.addEventListener('click', function() {
    var replaceString = document.getElementById("replace_input").value;
    replaceSelectedItemWithString(replaceString);
  })

  /*
    Performs similarly to the replaceAllSelectedItemsWithString function,
    except that this function replaces all occurences found in the
    initSearchFunc function.
  */
  var replaceAllSelectedItemsWithString = function(replaceString) {
    if (searchString != null) {
      var spansToHighlight = document.getElementsByClassName("spans colored");
      for (var i = 0; i < spansToHighlight.length; i++) {
        var textInSpan = spansToHighlight[i].innerHTML;
        console.log(textInSpan);
        var replacedText = textInSpan.replace(searchString, replaceString);
        spansToHighlight[i].innerHTML = replacedText;
      }
      var searchText = document.getElementById("search_input").value;
      initSearchFunc(searchText);
    }
  }

  var replaceAllButton = document.getElementById("replace_all_button");
  replaceAllButton.addEventListener('click', function() {
    var replaceString = document.getElementById("replace_input").value;
    replaceAllSelectedItemsWithString(replaceString);
  })

});
/*
  Performs the initSearchFunc when the user hits enter in the search bar.
*/
$('#search_input').on("keyup", function(e) {
    //if enter is pressed (keyCode of 13), we will call the search function
    if (e.keyCode == 13) {
      var searchText = document.getElementById("search_input").value;
      initSearchFunc(searchText);
    }
});
/* the following code was taken from this website
http://codepen.io/davidelrizzo/pen/cxsGb
  This code downloads the text file in Chrome and opens up a new page in Safari.
  It will write the text in the text area to the downloads folder in Chrome.
  It will use the same filename as the file loaded, but will not overwrite
  the file.
*/
$("#save_button").click( function() {
  var text = "";
  var spansToHighlight = document.getElementsByClassName("spans");
  for (var i = 0; i < spansToHighlight.length; i++) {
    text += spansToHighlight[i].innerHTML
  }

  var filename = file.name;
  var blob = new Blob([text], {type: "text/plain;charset=utf-8"});
  saveAs(blob, filename);
});
