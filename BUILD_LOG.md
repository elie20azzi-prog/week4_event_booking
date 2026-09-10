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



# Week 5 Build Log

## What I shipped

- Added Sidekiq for background jobs.
- Added `BookingNotificationJob`.
- Added `Orders::CreateService`.
- Added `OwnerAuthorizable` concern.
- Added Active Storage image uploads for Events.
- Added `BookingMailer`.
- Added REST API endpoints:
  - GET /api/v1/events
  - GET /api/v1/events/:id
- Added JSON serialization for Event and Category data.
- Added RSpec tests for the background job and mailer.
- Verified all tests pass.
- Verified RuboCop passes with no offenses.

## Errors and fixes

- Redis Homebrew installation was too slow, so Redis was built from source.
- The first mailer version used `@user.email`, but the correct field was `email_address`.
- The first service-object test failed because the user had already booked that event.
- RSpec found a temporary `OrdersController` class-definition issue, which was fixed.
- RuboCop formatting issues were fixed with autocorrect.

## Final verification

RSpec:
6 examples, 0 failures

RuboCop:
79 files inspected, no offenses detected