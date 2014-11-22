Template.postItem.helpers
	ownPost: ->
		if Meteor.user()
			return (@author is Meteor.user().username)
		else
			return (false)
	domain: ->
		a = document.createElement('a')
		a.href = @url;
		a.hostname