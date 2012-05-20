Controller = require 'controllers/controller'
User = require 'models/user'
UserPageView = require 'views/user_page_view'

module.exports = class UsersController extends Controller
  historyURL: 'users'

  show: (params) ->
    @model = new User({username: params.username})
    @view = new UserPageView({@model})
    @model.fetch()