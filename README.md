# Meteor has a few rules:

> 1. Code in the `/server` directory only runs on the server.
> 2. Code in the `/client` directory only runs on the client.
> 3. Everything else runs on both the client and server.
> 4. Your static assets (fonts, images, etc.) go in the /public directory.

# Meteor loading rules:

> 1. Files in `/lib` are loaded before anything else.
> 2. Any `main.*` file is loaded after everything else.
> 3. Everything else loads in *alphabetical* order based on the file name.

# Router Vocabulary

> 1. Routes: A route is the basic building block of routing. 
It's basically the set of instructions that tell the app 
where to go and what to do when it encounters a URL.
> 2. Paths: A path is a URL within your app. It can be static (`terms_of_service`) or dynamic (`/posts/xyz`),
 and even include query parameters (`/search?keyword=meteor`).
> 3. Segments: The different parts of a path, delimited by forward slashes (`/`).
> 4. Hooks: Hooks are actions that you'd like to perform before, after, or even during the routing process.
 A typical example would be checking if the user has the proper rights before displaying a page.
> 5. Filters: Filters are simply hooks that you define globally for one or more routes.
> 6. Route Templates: Each route needs to point to a template. If you don't specify one,
 the router will look for a template with the same name as the route by default.
> 7. Layouts: You can think of layouts as a "frame" for your content. They contain all the HTML code
 that wraps the current template, and will remain the same even if the template itself changes.
> 8. Controllers: Sometimes, you'll realize that a lot of your templates are reusing the same 
parameters. Rather than duplicate your code, you can let all these routes inherit from a single 
routing controller which will contain all the common routing logic.
