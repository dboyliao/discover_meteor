Router.configure
	layoutTemplate: 'layout'
	loadingTemplate: "loading"
	notFoundTemplate: 'notFound'
	waitOn: ->
		Meteor.subscribe "posts"


Router.route "/", 
	name: "postsList"

Router.route "/posts/:_id", 
	name: 'postPage'
	data: ->
		Posts.findOne({_id: @params._id})

Router.route "/submit", 
	name: "postSubmit"

Router.route "/posts/:_id/edit", 
	name: "editPage"
	data: ->
		Posts.findOne({_id: @params._id})

requireLogin = ->
	# console.log(@)
	# console.log(@.render)
	if !Meteor.user()
		# @.render("accessDenied")
		if Meteor.loggingIn()
			@.render(@.loadingTemplate);
		else
			@.render('accessDenied')
	else
		@.next()

Router.onBeforeAction 'dataNotFound', 
	only: 'postPage'

Router.onBeforeAction requireLogin, 
	only: 'postSubmit'

isOwner = ->
	currentPost = Posts.findOne({_id:@params._id})
	# console.log(currentPost)
	if !Meteor.user()
		@.render("accessDenied")
	else if !(Meteor.user().username is currentPost.author)
		@.render("accessDenied")
	else
		@.next()

Router.onBeforeAction isOwner, 
	only: 'editPage'

