$( document ).ready(function() {
  var fileInput = document.getElementById('fileInputField');
  var textArea = document.getElementById('user_text');

  var fillTextArea = function(evt) {
    var file = fileInput.files[0];
    textType = /text.*/;

    if (file.type.match(textType)) {
    	var fileReader = new FileReader();

    	fileReader.onload = function(e) {
    		textArea.innerText = fileReader.result;
    	}

    	fileReader.readAsText(file);
    }else {
    	textArea.innerText = "Unable to load file; incompatible file type.  Only text files are supported.";
    }
  }

  fileInput.addEventListener('change', fillTextArea);

  /*
    Adding Event Listener for searching for strings
  */
  /*
  var matches = null;
  var searchString = null;
  var hasSearched = false;
*/
  var initSearchFunc = function(strToFind){
    if(true){
      var textTag = document.getElementById("user_text");
      var text = textTag.innerText;

      var myRe = new RegExp(strToFind);
      var myArray = myRe.exec(text);
      alert(myArray);
    }
  }

  var searchButton = document.getElementById("search_button");
  searchButton.addEventListener('click', function(){
    var searchText = document.getElementById("search_input").value;
    initSearchFunc(searchText);
  });

});
