angular.module('flashApp')
  .controller 'BoardNavCtrl', ($scope, Restangular) ->
     Boards = Restangular.one('boards')
     Boards.get().then (boards) ->
       if boards.status == "success"
        $scope.boards = boards.data

