# Rails Sample Application

This is a sample Rails application for demonstration purposes.

## Requirements

* Ruby 3.2.2
* Rails 7.1.0
* PostgreSQL

## Setup

```bash
# Clone the repository
git clone https://github.com/naoisobe/mcp_test.git
cd mcp_test

# Install dependencies
bundle install

# Create and migrate the database
rails db:create
rails db:migrate

# Start the server
rails server
```

## Features

* User authentication
* CRUD operations
* API endpoints
* Testing with RSpec

## Directory Structure

```
app/               # Application code
  controllers/     # Controllers
  models/          # Models
  views/           # Views
  services/        # Service objects
config/            # Configuration files
db/                # Database files
spec/              # Tests
```

## License

MIT
