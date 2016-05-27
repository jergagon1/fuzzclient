angular.module 'fuzzApp'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'finder',
        url: '/'
        templateUrl: 'app/fuzzFinder/partials/finder.html'
        controller: 'FinderCtrl'
        controllerAs: 'finder'
      .state 'profile',
        url: '/profile'
        templateUrl: 'app/profile/partials/profile.html'
        controller: 'ProfileCtrl'
        controllerAs: 'profile'
    $urlRouterProvider.otherwise '/'
