EditPostFormView = require 'views/post/edit_post_form_view'
template = require 'views/templates/post'
View = require 'views/base/view'

module.exports = class PostView extends View
  template: template
  className: 'post'
  tagName: 'article'

  initialize: ->
    super
    @delegate 'click', '.post-edit-button', @editPost
    @delegate 'click', '.post-delete-button', @deletePost

  editPost: (event) =>
    @$('.post-text').remove()
    createNewPost = =>
      container = @$('.post-content')
      editPostView = new EditPostFormView {@model, container}
      editPostView.on 'dispose', @render
      @subview 'editPostForm', editPostView
    createNewPost()

  deletePost: (event) =>
    @model.destroy()
