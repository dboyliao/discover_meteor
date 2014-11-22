Meteor.publish "posts", 
				(author) -> 
					# console.log(Meteor.user())
					Posts.find({flagged:false, author:author})

Meteor.publish "allPosts", ->
					Posts.find()