# Week 4 Build Log

## What I shipped

- Built a complete Rails event-booking application.
- Added user registration, login, logout, and password-based authentication.
- Added authorization so only event owners can edit or delete their events.
- Added Event, Category, Order, and Ticket relationships.
- Added nested booking routes under Events.
- Added event search.
- Added pagination using Pagy.
- Added validations for events, categories, tickets, and duplicate bookings.
- Added RSpec + Capybara feature specs for the core user stories.
- Verified that all RSpec specs pass.
- Verified that RuboCop passes with no offenses.
- Added setup and run instructions to the README.

## What confused me

One issue was adding `category_id` to existing Event records. The migration originally used `null: false`, but existing events did not yet have a category, which caused a `PG::NotNullViolation`.

Another issue was understanding how Capybara finds form fields. The generated login form used placeholders instead of labels, so the feature spec had to target the placeholder text.

## One open question

When should a Rails application use a custom authorization method like the one used for event ownership, and when would it be better to introduce an authorization library such as Pundit?