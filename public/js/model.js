var Game = function(){
  this.start = new Date().getTime();
  this.end = {};
  this.winner = {};
  this.loser = {};
};

Game.prototype = {
  winning_player: function(player1, player2){
   if ($(player1.position).is($(player1.name+" td:last"))){
      this.loser = player2;
      this.winner = player1;
      return "winner!";
   }
   else if ($(player2.position).is($(player2.name+" td:last"))){
      this.winner = player2;
      this.loser = player1;
      return "winner!";
   }
   else
      return "none";
  }
};

var Player = function(active_player){
  this.name = active_player;
  this.position = active_player+" td.active";
};

Player.prototype = {
  advance: function(){
  $(this.position).removeClass("active").next().addClass("active");
  }
};


var pass_data = function(winning_player){

    var time = (game.end - game.start)/1000;
    $("#winner_r").val(winning_player);
    $("#time_r").val(time);
    $("#winner_p").val(winning_player);
    $("#time_p").val(time);
};

 