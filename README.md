## chatplace - realtime place centric chat

 - **Author:** Adon Metcalfe
 - **Student No:** 20138635
 - **Unit Shortcode:** cits3403
 - **Application Type:** Real Time Chat
 - **Application Topic:** Finding people to chat to locally

This application is meant to enable people to easily connect to chat rooms that have been created near their location, using browsers geolocation api. The chatrooms locations & history will be stored in a database so people can resume chatting after disconnecting/reconnecting??

### Usage

 - To install: ./setup.sh
 - To run: ./run.sh

### Baseline (85%)

The system should:

 - allow a user to create an account and login to the system;
  - Account registration/login using [Mozilla Persona](http://www.mozilla.org/en-US/persona/) with autoregister
 - allow the user to create a chat room;
  - Done
 - allow users to join an existing chat room;
  - Done
 - should use AJAX to dynamically post content to the server; and
  - Uses websockets via faye
 - should use AJAX to periodically update the chat stream
  - Uses websockets via faye

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
