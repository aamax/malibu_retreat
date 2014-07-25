usrCtrl = @malibuweb.controller 'UserCtrl', ($scope, userService) ->
  $scope.users = []
  $scope.currentUserId = parseInt(angular.element("#current_user_id").val())
  $scope.currentUserName = angular.element("#current_user_name").val()
  $scope.currentUserRoles = angular.element("#current_user_roles").val()
  $scope.currentUserIsAdmin = angular.element("#current_user_is_admin").val()

  userService.loadUsers()

  $scope.$on "users loaded", ->
    $scope.users = userService.getUsers()

  $scope.showUser = () ->
    alert($scope.currentUserId)

  $scope.currentUserSeesButtons = (user) ->
    ($scope.currentUserisAdmin() || ($scope.currentUserId == user.id))

  $scope.currentUserisAdmin = () ->
    $scope.currentUserIsAdmin == 'true'

usrCtrl.$inject = ['$scope', 'userService']