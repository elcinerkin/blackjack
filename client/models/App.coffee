#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @on('busted', @gameOver, @)

  # listen to player for Stand
  events:
  # invoke dealer to complete game
    'stand': ->
        do (@get 'dealerHand').complete
  # if restart triggered deal again
    'restart': ->do (@initialize)
    #'busted': ->do console.log("busted")

  gameOver: ->
    @.trigger('gameOver')

  redeal: ->
    if (@get 'deck').length > 10
      @set 'playerHand', (@get 'deck').dealPlayer()
      @set 'dealerHand', (@get 'deck').dealDealer()
    else
      @intitialize()

