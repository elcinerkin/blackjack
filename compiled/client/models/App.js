// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.App = (function(_super) {
    __extends(App, _super);

    function App() {
      return App.__super__.constructor.apply(this, arguments);
    }

    App.prototype.initialize = function() {
      var deck;
      this.set('deck', deck = new Deck());
      this.set('playerHand', deck.dealPlayer());
      this.set('dealerHand', deck.dealDealer());
      (this.get('playerHand')).on('all', this.playerStuff, this);
      return (this.get('dealerHand')).on('all', this.dealerStuff, this);
    };

    App.prototype.redeal = function() {
      if ((this.get('deck')).length > 10) {
        this.set('playerHand', (this.get('deck')).dealPlayer());
        return this.set('dealerHand', (this.get('deck')).dealDealer());
      } else {
        return this.intitialize();
      }
    };

    App.prototype.playerStuff = function(event) {
      switch (event) {
        case 'stand':
          return (this.get('dealerHand')).playOut();
        case 'busted':
          return this.trigger('winner:dealer');
      }
    };

    App.prototype.dealerStuff = function(event) {
      switch (event) {
        case 'stand':
          return this.findWinner();
        case 'busted':
          return this.trigger('winner:player');
      }
    };

    App.prototype.findWinner = function() {
      var dealerScore, playerScore;
      console.log('finding winner...');
      playerScore = Math.max((this.get('playerHand')).scores());
      dealerScore = Math.max((this.get('dealerHand')).scores());
      if (playerScore > dealerScore) {
        return this.trigger('winner', 'Player');
      } else {
        return this.trigger('winner', 'Dealer');
      }
    };

    return App;

  })(Backbone.Model);

}).call(this);

//# sourceMappingURL=App.map
