# Week 4 Event Booking Application

A Ruby on Rails event-booking application built as the Week 4 milestone of my internship build track.

## Features

* User registration
* User login and logout
* Password-based authentication
* Authorization based on event ownership
* Event creation and management
* Categories
* Orders/bookings
* Tickets
* Model associations
* Nested booking routes
* Event search
* Pagination with Pagy
* Validations
* Capybara feature specs for core user stories

## Requirements

* Ruby 4.0.5
* Rails 8.1.3.1
* PostgreSQL
* Bundler

## Setup

Clone the repository:

```bash
git clone https://github.com/elie20azzi-prog/week4_event_booking.git
```

Enter the project directory:

```bash
cd week4_event_booking
```

Install dependencies:

```bash
bundle install
```

Create the databases:

```bash
bin/rails db:create
```

Run the migrations:

```bash
bin/rails db:migrate
```

Prepare the test database:

```bash
bin/rails db:test:prepare
```

## Run the Application

Start the Rails server:

```bash
bin/rails server
```

Then open:

```text
http://localhost:3000
```

## Run the Tests

Run all RSpec tests:

```bash
bundle exec rspec
```

The project includes Capybara feature specs covering the core user stories:

* user signup and login
* authenticated event creation
* event search
* event booking

## Run RuboCop

Run:

```bash
bin/rubocop
```

The project should complete with no offenses.

## Main Models

* `User`
* `Event`
* `Category`
* `Order`
* `Ticket`

## Main Relationships

* A User has many Events.
* An Event belongs to a User.
* A Category has many Events.
* An Event belongs to a Category.
* A User has many Orders.
* An Event has many Orders.
* An Order belongs to a User and an Event.
* An Order has one Ticket.
* A Ticket belongs to an Order.
* Users can access booked Events through Orders.
* Events can access attendees through Orders.

## Authentication and Authorization

Rails authentication is used to manage user sessions.

Authenticated users can create and book events.

Event ownership is used for authorization so that only the owner of an event can edit or delete that event.

## Search and Pagination

Events can be searched by title.

Pagy is used to paginate the Events index so that only a limited number of records are shown on each page.

## Validation Examples

The application validates important data such as:

* Event title must be present.
* Event capacity must be greater than zero.
* Category name must be present.
* Ticket number must be present and unique.
* A user cannot book the same event more than once.
