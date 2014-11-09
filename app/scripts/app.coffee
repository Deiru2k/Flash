'use strict'

###*
 # @ngdoc overview
 # @name frontendApp
 # @description
 # # frontendApp
 #
 # Main module of the application.
###
angular
  .module('flashApp', [
    'ngAnimate',
    'ngCookies',
    'ngSanitize',
    'ngTouch',
    'ui.bootstrap',
    'ui.router'
    'restangular',
    'naif.base64'
  ])
  .config ($urlRouterProvider, $stateProvider, RestangularProvider) ->
    RestangularProvider.setBaseUrl('http://localhost:8080/v1/')
    $urlRouterProvider.otherwise('/b/')
    $stateProvider
      .state('main'; url: '/', templateUrl: 'views/main.html', controller: 'MainCtrl')
      .state('main.board'; url: ':board/', templateUrl: 'views/board.html', controller: "BoardCtrl")
      .state('main.thread'; url: ':board/:thread', templateUrl: 'views/thread.html', controller: "ThreadCtrl")
