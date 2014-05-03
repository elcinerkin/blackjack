class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->
    @set('stood', false)
    # @on('add', @isBlackjack, @) TODO

  hit: ->
    if not @isBusted() and not @get('stood') then @add(@deck.pop()).last()

  stand: ->
    # @set('stood', true)
    @trigger('stand', @)
    console.log("stood")

  # complete: ->
  #   #complete the dealer hand routine
  #   console.log("in complete")


  isBusted: ->
    console.log("in isBusted in hand model ", @scores()[0])
    if @scores()[0] > 20
      console.log("and now I'm triggering busted from in here...")
      @trigger('busted')

  isBlackjack: ->
    @trigger('blackjack')

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
