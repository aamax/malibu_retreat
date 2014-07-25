angular.module("malibuweb").factory "userService", ($rootScope, $resource) ->
  _users = $resource("/users/:id.json", {id: "@id"},
    update:
      method: "PUT"
      query:
        method: "GET"
        isArray: false
        headers:
          'Content-Type': 'application/json'
  )
  _userList = []

  loadUsers: () ->
    _userList = []
    _users.query((data)->
      _userList = data
      $rootScope.$broadcast "users loaded"
    )

  getUsers: () ->
    _userList

