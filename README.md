## chatplace - realtime place centric chat

 - **Author:** Adon Metcalfe
 - **Student No:** 20138635
 - **Unit Shortcode:** cits3403
 - **Application Type:** Real Time Chat
 - **Application Topic:** Finding people to chat to locally

This application is meant to enable people to easily connect to chat rooms that have been created near their location, using browsers geolocation api. The chatrooms locations & history will be stored in a database so people can resume chatting after disconnecting/reconnecting??

### Stage 1

 - Form Controls
  - The [Chatrooms](#/chat) page uses a textinput for searching
  - There is a form with buttons on the homepage when joined to a chatroom for sending messages/starting a video stream etc.
 - CSS - See the [Chatrooms](#/chat) page, the entire app uses mainly Bootstrap CSS
  - Some custom css is used for placing widgets, see [app.css](css/app.css)
  - The css layout is partially responsive except for the navbar
 - Client-side Programming: Javascript - Basic form validation
  - The [Chatrooms](#/chat) page validates the address used for searching
  - The email login form validates email addresses, but is a third party util (Mozilla Persona)
 - Demonstrating the use of DHTML (A combination of CSS, JavaScript, DOM and Event Models)
  - The site uses a single page layout, with fragments lazy loaded using angular
  - You can see examples of DHTML on the map widget, the login button (topright) and the navbar


### Baseline (85%)

The system should:

 - allow a user to create an account and login to the system;
  - Account registration/login could use [Mozilla Persona](http://www.mozilla.org/en-US/persona/)
 - allow the user to create a chat room;
  - Implies Database table for chatrooms
 - allow users to join an existing chat room;
  - Implies Database table for chathistory
 - should use AJAX to dynamically post content to the server; and
  - Will use websockets
 - should use AJAX to periodically update the chat stream
  - Will use websockets

### Full marks (100%)

The system should:

  - Allow users in the chat room to upload files, which are available for everyone in the room to download;
   - Implies static fileserver
  - If the file is an image, it should display the image inline;
   - Implies mimetype detection + viewer
  - If the file is an audio file, it should play file after it has uploaded;
   - JS audio player?
  - If the file is a video file, it should start playing the file after it has uploaded; and
   - JS video player?
  - have complete unit and functional/integrations tests (10%)
   - For ruby straightforward, for JS tricky (Karma maybe)

### Bonus marks (110%)

To get bonus marks for this project, the system should use the new HTML5 persistent web socket API, allowing the server to "push" updates to all clients that are currently logged in, in real-time (8%). Building the site using HTML5 and CSS3 is worth an additional 2%.
