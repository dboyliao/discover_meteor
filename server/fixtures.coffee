if Posts.find().count() == 0
	Posts.insert
			author: "Shacha Greif" 
			title: 'Introducing Telescope'
			url: 'http://sachagreif.com/introducing-telescope/'
			createdAt: new Date()

	Posts.insert
			author: "Meteor Team"
			title: 'Meteor'
			url: 'http://meteor.com'
			createdAt: new Date()

	Posts.insert
			author: "Matt DeBergalis"
			title: 'The Meteor Book'
			url: 'http://themeteorbook.com'
			createdAt: new Date()