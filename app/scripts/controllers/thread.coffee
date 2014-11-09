angular.module('flashApp')
  .controller 'ThreadCtrl', ($scope, $stateParams, $state, Restangular) ->
    $scope.thread = $stateParams.thread
    Board = Restangular.one('boards').one($stateParams.board)
    Thread = Board.one('threads').one($stateParams.thread)
    Board.get().then (board) ->
      $scope.board = board.data
    Thread.get().then (posts) ->
      $scope.posts = posts.data

    $scope.replyToThread = (reply) ->

      Thread.post('', reply).then (response) ->
        $scope.posts.push(response.data)
        $scope.reply = {}
        $('#newThreadImage').val(null)

    $scope.deletePost = (post) ->

      passUrl = post.id + '?password=' + post.password
      Posts = Restangular.one('posts').one(passUrl)
      Posts.remove().then () ->
        $state.transitionTo($state.current, $stateParams, {
          reload: true,
          inherit: false,
          notify: true
        });