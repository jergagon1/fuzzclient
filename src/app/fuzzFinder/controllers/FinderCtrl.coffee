'use strict'
###*
# @ngdoc function
# @name fuzzApp.controller:FinderCtrl
# @description
# FinderCtrl
# Controller of the fuzzApp
###
angular.module('fuzzApp').controller 'FinderCtrl', () ->
  @openedModal = null
  @activeClass = ''

  @modals =
    lostPet:
      name: 'lostPet'
      title: 'I LOST A PET'
      color: 'navigation-orange'
    foundPet:
      name: 'foundPet'
      title: 'I FOUND A PET'
      color: 'navigation-green'
    localFuzz:
      name: 'localFuzz'
      title: 'LOCAL FUZZALERTS'
      color: 'navigation-blue'

  @openModal = (modal)->
    @activeClass = @modals[modal].color
    console.log @
    @openedModal = modal

  @closeModals = ->
    @openedModal = null
    @activeClass = ''

  @modalOpened = (modal)->
    modal == @openedModal

  @getActiveClass = ->
    if @openedModal
      @activeClass
    else
      @closeModals()
  @
