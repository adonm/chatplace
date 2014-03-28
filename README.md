cits3403 location aware chathost
================================

This application is meant to enable people to easily connect to chat rooms that have been created near their location, using browsers geolocation api. The chatrooms locations & history will be stored in a database so people can resume chatting after disconnecting/reconnecting??

  - Application Type: Real Time Chat
  - Application Topic: Finding people to chat to locally

Baseline (85%)

The system should:

  - allow a user to create an account and login to the system;
  - allow the user to create a chat room;
  - allow users to join an existing chat room;
  - should use AJAX to dynamically post content to the server; and
  - should use AJAX to periodically update the chat stream

Full marks (100%)

The system should

  - Allow users in the chat room to upload files, which are available for everyone in the room to download;
  - If the file is an image, it should display the image inline;
  - If the file is an audio file, it should play file after it has uploaded;
  - If the file is a video file, it should start playing the file after it has uploaded; and
  - have complete unit and functional/integrations tests (10%)

Bonus marks (110%)

To get bonus marks for this project, the system should use the new HTML5 persistent web socket API, allowing the server to "push" updates to all clients that are currently logged in, in real-time (8%). Building the site using HTML5 and CSS3 is worth an additional 2%.

[MDN] (https://developer.mozilla.org/en-US/) is the best reference for HTML/CSS docs. e.g. [WebSockets] (https://developer.mozilla.org/en-US/docs/WebSockets/Writing_WebSocket_client_applications)


Libraries used:

  - [Bootstrap CSS Framework](http://getbootstrap.com/getting-started/)
  - [Angular.js](http://tutorialzine.com/2013/08/learn-angularjs-5-examples/)

Avoid using angulars built in routing, but Directives (little advanced) and Templates and Filters are awesome.

Testing with Karma (http://karma-runner.github.io/0.12/index.html)

Git tutorial: https://www.atlassian.com/git/tutorial/git-basics

Pages we should mock up:

  - Login screen
  - Chat room browser/finding page (with map?)
  - Profile/Dashboard with history
  - Actual chat room (include example video/audio/images)
  - User browser (find a user/see their chatrooms?)
  - About page (include summary of libraries used and design of site?)

All should have same navigation (bootstrap navbar) and perhaps a footer?

