angular.module('fuzzApp').component 'fuzzModal',
  templateUrl: 'app/components/fuzzModal/partials/fuzzModal.html'
  bindings:
    opened: '='
    modal: '<'
  transclude: true
  controller: ($timeout)->
    @activeTab = 1
    $timeout =>
      @color = @modal.color.replace 'navigation', 'nav-block'
      @isOpened = @opened == @modal.name
    , 100

    @close = ->
      @isOpened = false
      $timeout =>
        @opened = false
      , 300
    @switchTab = ()->
      if @activeTab == 1 then @close() else @activeTab--
    @
