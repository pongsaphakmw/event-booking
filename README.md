# Event Booking API test

## Overview
This project is just a simple RESTful API of Event Booking without the view. You can test with Postman or cURL to communicate with the application. There is only event booking flow, no authorize and authentication here.

## To run this project
You need Docker on your machine
then run with this command below
```
docker compose up -d
```

In this compose you will got PostgreSQL and Rails running together in the same docker network. If you want to see the database there are two ways. First, execute into the container and run with Rails console. Second, config docker compose to use host network to share the database with your running device.

## Routes
There are the routes I created you can try here
- events 
    - GET  /events(.:format)
    - GET  /events/:id(.:format)
- bookings
    - POST /bookings(.:format) Body{"user_id": int,"event_id": int,"quantity": int}
    - GET  /users/:id/bookings(.:format)
    - GET  /users/:id/bookings/:ticket_id(.:format)

## The things I want to improve are
- Writing a unit test with rspec
- Cover a validation and error response code
- Integrate with Authorize module
- Try to use Worker to maximize the efficiency of host resources
- Try to implement with Kafka when facing with high workload