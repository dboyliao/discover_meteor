Template.editPage.created = ->
	Session.set('postEditErrors', {})

Template.editPage.helpers 
	errorMessage: (field) -> 
  		Session.get('postEditErrors')[field]
  	errorClass: (field) -> 
  		if !!Session.get('postEditErrors')[field] then 'has-error' else ''


Template.editPage.events
	'submit form': (e) ->
		e.preventDefault()
		# console.log(@)
		currentPostId = @_id

		postProperties =
			url: $(e.target).find("[name=url]").val()
			title: $(e.target).find('[name=title]').val()

		errors = validatePost postProperties
		# console.log(errors)
		if errors.title or errors.url
			Session.set 'postEditErrors', 
				errors

		Posts.update currentPostId,
			{$set: postProperties},
			(err) ->
				if err
					Errors.throw err.reason
				else
					Router.go 'postPage', 
						{_id:currentPostId}

	'click .delete': (e) ->
		e.preventDefault()

		if confirm("Delete this post?")
			currentPostId = @_id
			Posts.remove currentPostId
			Router.go('postsList')

# Template.postEdit.events({
#   'submit form': function(e) {
#     e.preventDefault();

#     var currentPostId = this._id;

#     var postProperties = {
#       url: $(e.target).find('[name=url]').val(),
#       title: $(e.target).find('[name=title]').val()
#     }

#     Posts.update(currentPostId, {$set: postProperties}, function(error) {
#       if (error) {
#         // display the error to the user
#         alert(error.reason);
#       } else {
#         Router.go('postPage', {_id: currentPostId});
#       }
#     });
#   },

#   'click .delete': function(e) {
#     e.preventDefault();

#     if (confirm("Delete this post?")) {
#       var currentPostId = this._id;
#       Posts.remove(currentPostId);
#       Router.go('postsList');
#     }
#   }
# });