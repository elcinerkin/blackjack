#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @on 'busted blackjack', @gameOver, @
    (@get 'playerHand').on 'stand', @stand, @

  gameOver: ->
    console.log('app model gameOver method is called')
    @trigger('gameOver')

  redeal: ->
    if (@get 'deck').length > 10
      @set 'playerHand', (@get 'deck').dealPlayer()
      @set 'dealerHand', (@get 'deck').dealDealer()
    else
      @intitialize()

  stand: ->
    console.log("stand triggered and caught by appmodel")
    # Flip the dealer's card
    #(@get 'dealerHand').complete()
    # Compare dealer's score to playerHand's score
    debugger;
    (@get 'dealerHand').models[0].flip()
    # While dealer's hand < playerHand
    while Math.max.apply(0, (@get 'dealerHand').scores()) < (@get 'playerHand').scores()
      (@get 'dealerHand').hit()
    @gameOver
      # dealerHand hit
    # Check if dealerHand score > 21
    # If so, player won
    # If not, player lost
    # Profit!
