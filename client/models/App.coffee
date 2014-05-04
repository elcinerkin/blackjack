#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    #@on 'busted blackjack', @gameOver, @
    (@get 'playerHand').on 'all', @playerStuff, @
    (@get 'dealerHand').on 'all', @dealerStuff, @

  redeal: ->
    if (@get 'deck').length > 10
      @set 'playerHand', (@get 'deck').dealPlayer()
      @set 'dealerHand', (@get 'deck').dealDealer()
    else
      @intitialize()

  playerStuff: (event)->
    switch event
      when 'stand' then (@get 'dealerHand').playOut()
      when 'busted' then @trigger('winner:dealer')

  dealerStuff: (event)->
    switch event
      when 'stand' then @findWinner()
      when 'busted' then @trigger('winner:player')

  findWinner: ->
    console.log('finding winner...')
    playerScore = Math.max((@get 'playerHand').scores())
    dealerScore = Math.max((@get 'dealerHand').scores())
    if playerScore>dealerScore
      @trigger('winner','Player')
    else
      @trigger('winner','Dealer')
