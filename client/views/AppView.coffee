class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div disabled="disabled" class="game-over"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .redeal-button": ->
      @model.redeal()
      @render()

  initialize: ->
    @render()
    @model.on('winner', @endGame, @)

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  endGame: (whoWon)->
    console.log('ending game with ' + whoWon)
    # debugger;
    @$el.find('.game-over').html(whoWon + " won!")
    @$el.find('button').attr('disabled',true).append($('<button class="redeal-button">Redeal</button>'))
    # @render()
