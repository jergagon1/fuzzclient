'use strict'
###*
# @ngdoc component
# @name fuzzApp.component:navBar
# @description
# # navBar
###

angular.module('fuzzApp').component 'navBar', {
  templateUrl: 'app/components/navigation/partials/navBar.html'
  bindings:
    navColor: '@'

  controller: (navBarMenu, AuthService, $location)->
    @menuItems = navBarMenu
    @user = {}

    AuthService.getCurrentUser().then (user)=>
      @user = user

    @getStatusClass = (item)->
      if item.link == $location.path()
        'active'
      else
        ''

    @getItemClass = (item)->
      'link-home'
    @getUserPhoto = ->
      'background-image' :'url("'+@user.avatar+'")'

    @
}
