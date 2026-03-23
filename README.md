## Tech Stack

Backend:

* Ruby on Rails w GraphQL (Ruby 4)
* Rails (v8)


Frontend:

* Vue.js w Apollo Client (Vue 3.5)

## Prerequisites

Make sure the following are installed:

* Node.js
* npm
* Ruby
* Rails
* PostgreSQL

## Project Structure

```
root/
  backend/
  frontend/
```

## Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/cookietriestoprogram/supportdesk-backend.git
git clone https://github.com/cookietriestoprogram/supportdesks-frontend.git
```

---

## Backend Setup
Go to the backend repo

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
```

### Configure CORS

Replace the existing code in `config/initializers/cors.rb` with:

```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
```

### Start backend server

```bash
rails server
```

Backend will run at:
http://localhost:3000

GraphQL endpoint:
http://localhost:3000/graphql

---

## Frontend Setup

Go to the frontend
```bash
npm install
npm run dev
```

Frontend will run at:
http://localhost:5173

---

## Environment Variables

Create `.env` file.

Frontend example:

```
VITE_API_URL=http://localhost:3000/graphql
```

---

## Running the Application

1. Start the backend server
2. Start the frontend server
3. Open the frontend URL in your browser

---
