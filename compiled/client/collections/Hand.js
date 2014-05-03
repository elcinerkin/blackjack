// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Hand = (function(_super) {
    __extends(Hand, _super);

    function Hand() {
      return Hand.__super__.constructor.apply(this, arguments);
    }

    Hand.prototype.model = Card;

    Hand.prototype.initialize = function(array, deck, isDealer) {
      this.deck = deck;
      this.isDealer = isDealer;
      return this.on('add', this.isBusted, this);
    };

    Hand.prototype.hit = function() {
      return this.add(this.deck.pop()).last();
    };

    Hand.prototype.stand = function() {
      this.trigger('stand', this);
      return console.log("stood");
    };

    Hand.prototype.complete = function() {
      return console.log("in complete");
    };

    Hand.prototype.isBusted = function() {
      console.log("in isBusted in hand model ", this.scores()[0]);
      if (this.scores()[0] > 21) {
        return this.trigger('busted');
      }
    };

    Hand.prototype.scores = function() {
      var hasAce, score;
      hasAce = this.reduce(function(memo, card) {
        return memo || card.get('value') === 1;
      }, false);
      score = this.reduce(function(score, card) {
        return score + (card.get('revealed') ? card.get('value') : 0);
      }, 0);
      if (hasAce) {
        return [score, score + 10];
      } else {
        return [score];
      }
    };

    return Hand;

  })(Backbone.Collection);

}).call(this);

//# sourceMappingURL=Hand.map
