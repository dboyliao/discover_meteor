Meteor has a few rules:

1. Code in the /server directory only runs on the server.

2. Code in the /client directory only runs on the client.

3. Everything else runs on both the client and server.

4. Your static assets (fonts, images, etc.) go in the /public directory.

Meteor loading rules:

1. Files in /lib are loaded before anything else.

2. Any main.* file is loaded after everything else.

3. Everything else loads in alphabetical order based on the file name.

