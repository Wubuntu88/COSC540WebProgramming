$( document ).ready(function() {
  var fileInput = document.getElementById('fileInputField');

  //var wordsInText= []; // array of words in the text file

  var fillTextArea = function(evt) {
    var file = fileInput.files[0];
    textType = /text.*/;

    if (file.type.match(textType)) {
    	var fileReader = new FileReader();

    	fileReader.onload = function(e) {
        var textArea = document.getElementById('user_text');
        var paragraphsInText = fileReader.result.split("\n");
        for(var i = 0; i < paragraphsInText.length; i++) {
          //if (paragraphsInText[i] != "") {
            var wordsInParagraph = paragraphsInText[i].split(" ");
            for(var j = 0; j < wordsInParagraph.length; j++) {
              if (j == wordsInParagraph.length - 1) {
                textArea.innerHTML += "<span class=\"spans\">" + wordsInParagraph[j] + "\n</span>";
              }else {
                textArea.innerHTML += "<span class=\"spans\">" + wordsInParagraph[j] + " </span>";
              }
            }
          //}
        }

    	}

    	fileReader.readAsText(file);
    }else {
    	textArea.innerHTML = "Unable to load file; incompatible file type.  Only text files are supported.";
    }
  }

  fileInput.addEventListener('change', fillTextArea);

  /*
    Adding Event Listener for searching for strings
  */

  var RED_HIGHLIGHT = "#ffb7b7";
  var YELLOW_HIGHLIGHT = "#fff2a8";

  var searchString = null; // last search string for when the user clicked the search button

  initSearchFunc = function(strToFind){
    indexOfCurrentSearch = -1;
    var spansToHighlight = document.getElementsByClassName("spans");
    if ( (searchString == null || strToFind != searchString) && strToFind != "") {//if condition maybe bad
      //if there was a previous search term, we remove the 'colored' additional class
      //and reset the previously serched terms' background color to transparent
      $( "span" ).removeClass("colored");
      $(".spans").css("background-color", "transparent");

      searchString = strToFind;
      var re = new RegExp("^" + strToFind + "[.,]{0,1}\\s*$");
      $(".spans").css("background-color", "transparent");
      for (var i = 0; i < spansToHighlight.length; i++) {
        var word = spansToHighlight[i].innerHTML;
        var match = re.exec(word);
        if (match != null) {
          spansToHighlight[i].className = "spans colored";
          spansToHighlight[i].style.backgroundColor = RED_HIGHLIGHT;
        }
      }
    }
  }

  var searchButton = document.getElementById("search_button");
  searchButton.addEventListener('click', function() {
    var searchText = document.getElementById("search_input").value;
    initSearchFunc(searchText);
  });


  var indexOfCurrentSearch = -1;
  var gotoNextSearchItem = function() {
    if (searchString != null) {
      var spansToHighlight = document.getElementsByClassName("spans colored");
      indexOfCurrentSearch = (indexOfCurrentSearch + 1) % spansToHighlight.length;
      spansToHighlight[indexOfCurrentSearch].style.backgroundColor = YELLOW_HIGHLIGHT;
      if (spansToHighlight.length > 1) {
        var prevIndex = indexOfCurrentSearch == 0 ? spansToHighlight.length - 1 : indexOfCurrentSearch - 1;
        spansToHighlight[prevIndex].style.backgroundColor = RED_HIGHLIGHT;
      }
    }
  }

  var nextButton = document.getElementById("next_button");
  nextButton.addEventListener('click', function() {
    gotoNextSearchItem();
  })

  var gotoPreviousSearchItem = function() {
    if (searchString != null) {
      var spansToHighlight = document.getElementsByClassName("spans colored");
      if (indexOfCurrentSearch == -1 || indexOfCurrentSearch == 0) { //if the user has not clicked the next button yet and no term is highlighted yellow
        indexOfCurrentSearch = spansToHighlight.length - 1;
      }else {
        indexOfCurrentSearch--;
      }
      spansToHighlight[indexOfCurrentSearch].style.backgroundColor = "yellow";
      if (spansToHighlight.length > 1) {
        var prevIndex = indexOfCurrentSearch == spansToHighlight.length - 1 ? 0 : indexOfCurrentSearch + 1;
        spansToHighlight[prevIndex].style.backgroundColor = "red";
      }
    }
  }

  var previousButton = document.getElementById("previous_button");
  previousButton.addEventListener('click', function() {
    gotoPreviousSearchItem();
  })

  /*
    Replace functionality
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

//I should change this so that the initSearchFunc is not a global function
$('#search_input').on("keyup", function(e) {
    if (e.keyCode == 13) {  //if enter is pressed (keyCode of 13), we will call the search function
      var searchText = document.getElementById("search_input").value;
      initSearchFunc(searchText);
    }
});
/* the following code was taken from this website
http://codepen.io/davidelrizzo/pen/cxsGb
*/
$("#save_button").click( function() {
  var text = "";
  var spansToHighlight = document.getElementsByClassName("spans");
  for (var i = 0; i < spansToHighlight.length; i++) {
    text += spansToHighlight[i].innerHTML
  }

  var filename = "LI";
  var blob = new Blob([text], {type: "text/plain;charset=utf-8"});
  saveAs(blob, filename + ".txt");

});
