## Colby's Blog

# Ruby / Rails
This is my first dive into Ruby / Rails.

# Focus
My focus with this project is purely on getting to know Rails, and becoming more comfortable with Ruby in general. I will not be paying as much attention as I should be on other things, like documentation and testing.

# Goals
Eventually, I intend to rewrite this project in a more concise way. As it is, this is simply my first time building a Rails project, and is the product of me piecing it together as I go. For now, my goal is to get the application looking good from a visitors perspective, and functioning well enough. The codebase, will likely not hold up well to scrutiny.

# Model
The model revolves around Articles, which have a title, sub_title, content, created(date) and edited(date), as well as an integer id that Rails maintains on its own via some kind of magic. There are also Blurbs, which relate to an Article, but only contain the title, sub_title, and created properties. Blurbs are meant to be used as previews for the articles.

# Controller
The Article controller is mostly standard Rails. I intend to add some functionality which allows browsing through articles one at a time by date, or jumping straight to the oldest or latest article.

Blurbs are never created directly. When they are requested, the application searches the Article database and builds the appropriate Blurbs from there. At the moment, the only action is to request the latest N blurbs. This function is meant to be used when requesting a summary of the latest few Articles. This can also be accessed in json form, so that other applications can use it as well.

# View
The view is built with Rails for now, but I am contemplating bringing in a front-end framework, probably Angular, at some point if necessary.

# Authentication
Articles (and Blurbs) should be viewable by anyone, but creating, editing, and deleting should only be done by the admin. There should only be one admin, so there is no need to create a User model with Usernames and Passwords, just a single password needs to exist.

I've done this by storing the password in an environment variable called `RAILS_BLOG_PASSWORD`. In development, this should be declared in a file `/config/secrets.rb`, which is in .gitignore. Add a line like so:
```
ENV['RAILS_BLOG_PASSWORD'] = 'foobar'
```
In production, I recommend declaring the environment variable through Docker. The application will not check the secrets file except in Development.
