'use strict'
###*
# @ngdoc factory
# @name fuzzApp.factory:AuthService
# @description
# # AuthService
###

angular.module('fuzzApp').factory 'AuthService', ['$timeout','$q',($timeout,$q)->
  class AuthService

    @user = null
    @fetchUser = ->
      $timeout =>
        @user = {
          name: "Ruben"
          id: 1
          info: 'Some info'
          avatar: 'http://lorempixel.com/400/200/sports/'
        }
      , 1000

    @getUser = ->
      @user

    @setUser = (user)->
      @user = user

    @getCurrentUser = ->
      deferred = $q.defer()

      if !@user

        deferred.resolve(@fetchUser())
      else
        deferred.resolve(@getUser())

      deferred.promise
]