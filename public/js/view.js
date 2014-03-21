var View = {
  give_beer: function(winning_player){
    $(winning_player.position).css("background-image","url('/beer-icon.png')");
  },

  make_cry: function(losing_player){
    $(losing_player.position).css("background-image","url('/crying-face.jpeg')");
  },

  announce_winner: function(winner){
    if (winner.name === "#player1_strip"){
      $('#winner').html("Player 1 wins!").show();
    }
    else {
      $('#winner').html("Player 2 wins!").show();
    }

  }

};
