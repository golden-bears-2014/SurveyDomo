// this code is ugly because 
// 1. global variables! - solution: create objects and encapsulate
// 2. embedded if statements!
// 3. repeated code
// 4. naming functions with capital words -- Caps are used for "Classes"/Constructor Functions

$(document).ready(function () {
  
  var game = new Game();
  var player1 = new Player("#player1_strip");
  var player2 = new Player("#player2_strip");
  var total_time = {};

  $('#winner').hide();
  $('#buttons').hide();

  $(document).on('keydown', function(event) {
      //console.log("pressed key " + game.winning_player(player1,player2));
      if (game.winning_player(player1,player2) === "none"){
        if (event.keyCode == 65) {player1.advance();}
        else if (event.keyCode == 76) {player2.advance();}
      }

      if (game.winning_player(player1,player2) !== "none"){
        game.end = new Date().getTime();
        total_time = (game.end - game.start)/1000;
        View.announce_winner(game.winner);
        View.give_beer(game.winner);
        View.make_cry(game.loser);
        $('#buttons').show();
      }

  });

   $("#next_round").on('click', function(){
    var game_data = {elapsed_time: total_time, winner: game.winner.name};
    $.ajax({
      type: "POST",
      url: this.value,
      data: game_data
    }).done(function(erb){
    $("body").html(erb);
    });
  });

  $("#show_results").on('click', function(){
    var game_data = {elapsed_time: total_time, winner: game.winner.name};
    $.ajax({
      type: "POST",
      url: this.value,
      data: game_data
    }).done(function(erb){
      $("body").html(erb);
    });
  });



});


