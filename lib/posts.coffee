@Posts = new Mongo.Collection 'posts'

@validatePost = (post) ->
	errors = {}
	if !post.title
		errors.title = "Title can not be empty."
	if !post.url
		errors.url = "URL can not be empty."
	errors

# Posts.allow
#   insert: (userId, doc) ->
#     !!userId
ownsDocument = (userId, post) ->
	post && post.userId is userId


Posts.allow
	update: (userId, post) ->
		ownsDocument(userId, post)
	remove: (userId, post) ->
		ownsDocument(userId, post)

Posts.deny
	update: (userId, post, fieldNames, modifier) ->
		# may only edit the following two fields:
		cond1 = _.without(fieldNames, 'url', 'title').length > 0
		errors = validatePost(modifier.$set)
		cond2 = errors.title or errors.url
		cond1 or cond2



Meteor.methods 
	postInsert: (postAttrs) ->
		check Meteor.userId(), String
		check postAttrs, 
			title: String
			url: String
			createdAt: Date
		errors = validatePost postAttrs
		if errors.title or errors.url
			throw new Meteor.Error 'invalid-post', 
				"You must set a title and URL for your post"
		if Meteor.isServer
			postAttrs.title += "(server)"
			# Meteor._sleepForMs(5000)
		else
			postAttrs.title += "(client)"
			Router.go("postsList")

		postWithSameLink = Posts.findOne 
			url: postAttrs.url

		if postWithSameLink
			return (
				postExists: true, 
				_id: postWithSameLink._id
			)
				
		user = Meteor.user()
		post = _.extend postAttrs, 
			userId: user._id
			author: user.username
			submitted: new Date()

		postId = Posts.insert(post)
		_id: postId
