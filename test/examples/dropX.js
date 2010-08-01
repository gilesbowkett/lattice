$(document).ready(function(){
  var current_pending = 0;

  var numbers_and_names = {
    7: "seven",
    6: "six",
    5: "five",
    4: "four",
    3: "three",
    2: "two",
    1: "one"
  };

  function colorize() {
    for (i = 1; i < 8; i++) {
      $('.tile_number:contains(' + i + ')').addClass(numbers_and_names[i]);
    }
  }

  colorize();
});
