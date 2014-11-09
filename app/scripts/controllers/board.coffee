angular.module('flashApp')
  .controller 'BoardCtrl', ($scope, $stateParams, $state, Restangular) ->
    $scope.newThread = {}
    $scope.error = null
    Board = Restangular.one('boards').one($stateParams.board)
    Threads = Board.one('threads')
    Board.get().then (board) ->
      $scope.board = board.data
    Threads.get().then (threads) ->
      if threads.data
        $scope.threads = threads.data
      else
        $scope.threads = []

    $scope.postNewThread = (thread) ->
      Threads.post('', thread).then(
        (response) ->
          if response.status == "success"
            $scope.threads.push(response.data)
            $scope.newThread = {}
            $scope.error = null
            $('#newThreadImage').val(null)
        ,
        (error) ->
          console.log(error)
          $scope.error = {
            "code": error.data.code
            "message": error.data.message
          }
      )
    $scope.deleteThread = (thread) ->
      passUrl = thread.id + '?password=' + thread.password
      Threads.one(passUrl).remove().then () ->
        $state.transitionTo($state.current, $stateParams, {
          reload: true,
          inherit: false,
          notify: true
        });