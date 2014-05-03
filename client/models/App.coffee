#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @on 'busted blackjack', => @gameOver

  events:
    'stand': ->
        do (@get 'dealerHand').complete
    'restart': ->do (@initialize)
    #'busted': ->do console.log("busted")

  gameOver: ->
    console.log('app model gameOver method is called')
    @trigger('gameOver')

  redeal: ->
    if (@get 'deck').length > 10
      @set 'playerHand', (@get 'deck').dealPlayer()
      @set 'dealerHand', (@get 'deck').dealDealer()
    else
      @intitialize()

