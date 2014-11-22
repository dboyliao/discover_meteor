# Meteor.subscribe "posts", "bob-smith"

Meteor.subscribe "allPosts"

Meteor.startup ->
	Tracker.autorun ->
		console.log('There are ' + Posts.find().count() + ' posts')