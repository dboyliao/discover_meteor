Meteor.publish "posts", 
				(author) -> 
					Posts.find({flagged:false, author:author})

Meteor.publish "allPosts", ->
					Posts.find()