angular.module('fuzzApp').config ($logProvider, uiGmapGoogleMapApiProvider) ->
  'ngInject'
  uiGmapGoogleMapApiProvider.configure
    v: '3',
    libraries: 'weather,geometry,visualization,places'

  # Enable log
  $logProvider.debugEnabled true
