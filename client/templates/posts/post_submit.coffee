

Template.postSubmit.helpers
	user: ->
		Meteor.user()

Template.postSubmit.events
	'submit #submitPost': (e) ->
		# e is a jQuery event object
		# console.log(e)
		e.preventDefault()
		post =
			url: $(e.target).find('[name=url]').val(),
			title: $(e.target).find('[name=title]').val()
			createdAt: new Date()
		errors = validatePost post
		console.log(errors)
		if errors.title or errors.url
			Session.set('postSubmitErrors', errors)
			return 
		Meteor.call "postInsert", post, (err, result) ->
			if err
				Errors.throw err.reason
			if result.postExists
				throwError("This link has already been posted")
			# Router.go("postPage", {_id:result._id})
			Router.go("postsList")

Template.postSubmit.created = ->
	Session.set(
		'postSubmitErrors',
		{}
	)

Template.postSubmit.helpers
	errorMessage: (field) ->
		Session.get('postSubmitErrors')[field]

	errorClass: (field) ->
		if !!Session.get('postSubmitErrors')[field] then 'has-error' else ''