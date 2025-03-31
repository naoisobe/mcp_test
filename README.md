# Rails Sample Application

This is a sample Rails application with basic user authentication, posts management, and API endpoints.

## Features

* User authentication (sign up, log in, log out)
* User authorization and roles (admin vs regular users)
* Posts management with CRUD operations
* API endpoints for users and posts
* Responsive design with Bootstrap 5
* Testing setup with RSpec, Factory Bot, and Shoulda Matchers

## Requirements

* Ruby 3.2.2
* Rails 7.1.0
* PostgreSQL
* Node.js and Yarn (for webpacker)

## Setup

```bash
# Clone the repository
git clone https://github.com/naoisobe/mcp_test.git
cd mcp_test

# Install dependencies
bundle install
yarn install

# Setup the database
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed

# Or use the dev setup task
bin/rails dev:setup

# Start the server
bin/rails server
```

## Development

### Quick setup

To quickly set up the development environment with sample data:

```bash
bin/rails dev:setup        # Reset and setup the development environment
bin/rails dev:reset        # Reset the database and load seed data
bin/rails dev:sample_data  # Create additional sample data
```

### Running Tests

```bash
bin/rails spec
```

### Sample User Accounts

After running the seed task, you can log in with these accounts:

* Admin: admin@example.com / password
* User: user1@example.com / password

## API Endpoints

### Users

* `GET /api/v1/users` - List all users
* `GET /api/v1/users/:id` - Get user details
* `POST /api/v1/users` - Create a new user
* `PUT /api/v1/users/:id` - Update a user
* `DELETE /api/v1/users/:id` - Delete a user

### Posts

* `GET /api/v1/posts` - List all posts
* `GET /api/v1/posts/:id` - Get post details
* `POST /api/v1/posts` - Create a new post
* `PUT /api/v1/posts/:id` - Update a post
* `DELETE /api/v1/posts/:id` - Delete a post

## Directory Structure

```
app/
  controllers/     # Controllers
  models/          # Models
  views/           # Views
  services/        # Service objects
config/            # Configuration files
db/                # Database files
lib/
  tasks/           # Custom rake tasks
spec/              # Tests
```

## License

MIT
