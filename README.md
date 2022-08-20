# Putting it All Together: Client-Server Communication

## Learning Goals

- Understand how to communicate between client and server using fetch, and how
  the server will process the request based on the URL, HTTP verb, and request
  body
- Debug common problems that occur as part of the request-response cycle

## Introduction

Just like the last lesson, we've got code for a React frontend and Rails API
backend set up. This time though, it's up to you to use your debugging skills to
find and fix the errors!

To get the backend set up, run:

```console
$ bundle install
$ rails db:migrate db:seed
$ rails s
```

Then, in a new terminal, run the frontend:

```console
$ npm install --prefix client
$ npm start --prefix client
```

Confirm both applications are up and running by visiting
[`localhost:4000`](http://localhost:4000) and viewing the list of toys in your
React application.

## Deliverables

In this application, we have the following features:

- Display a list of all the toys
- Add a new toy when the toy form is submitted
- Update the number of likes for a toy
- Donate a toy to Goodwill (and delete it from our database)

The code is in place for all these features on our frontend, but there are some
problems with our API! We're able to display all the toys, but the other three
features are broken.

Use your debugging tools to find and fix these issues.

There are no tests for this lesson, so you'll need to do your debugging in the
browser and using the Rails server logs and `byebug`.

**Note**: You shouldn't need to modify any of the React code to get the
application working. You should only need to change the code for the Rails API.

As you work on debugging these issues, use the space in this README file to take
notes about your debugging process. Being a strong debugger is all about
developing a process, and it's helpful to document your steps as part of
developing your own process.

## Your Notes Here

- Add a new toy when the toy form is submitted

  - How I debugged:
    I debugged the form by carefully revising the create API for rails by first going to the Config-Routes.rb. typing rails routes. to make sure it's there and valid.
    second I began to add error responses for anything not found 404 and 500 in the server with ActiveRecord::Invalid and NotFound
    third I tested why the create submit form wasn't working and it returned and error of 500.
    I carefully revised the create and saw a typo error of Toys.create and should be Toy.create.

- Update the number of likes for a toy

  - How I debugged:
    I debugged the number of likes for toy by doing the same thing above. first checking if the routing is correct. to which the :update route was correct. Next I added the response errors to the #update method toy.update! As well as consolidate the method to look cleaner for better review. Then I realized that it does not have a render json:
    Thats why it returned an eror of 204 No Content.

- Donate a toy to Goodwill (and delete it from our database)

  - How I debugged:
    I debugged the Donate Button by doing the same thing. First reviewing the routes and found that the routes did not have a :destroy which solved the issue.
