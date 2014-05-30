"use strict";

angular.module("chatplace", [ "ui.gravatar", "mgcrea.ngStrap" ]).run(function($rootScope, $location, $http) {
    var scope = $rootScope;
    scope.location = $location;
    var loadLeaflet = function(position) {
        if (position == undefined) {
            var position = {
                coords: {
                    longitude: 115.8589,
                    latitude: -31.9522
                }
            };
        }
        // create a map in the "map" div, set the view to a given place and zoom
        window.map = L.map("map").setView([ position.coords.latitude, position.coords.longitude ], 12);
        // add an OpenStreetMap tile layer
        L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        angular.element(document.getElementById("mapLoadText")).remove();
    };
    scope.loadMap = function() {
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(loadLeaflet);
        } else {
            setTimeout(loadLeaflet, 50);
        }
    };
    scope.loadWebRTC = function() {
        angular.element(document.getElementById("localVideo")).removeClass("ng-hide");
        var webrtc = new SimpleWebRTC({
            // the id/element dom element that will hold "our" video
            localVideoEl: "localVideo",
            // the id/element dom element that will hold remote videos
            remoteVideosEl: "remotesVideos",
            // immediately ask for camera access
            autoRequestMedia: true
        });
        // we have to wait until it's ready
        webrtc.on("readyToCall", function() {
            // this should poll ruby server and create/get room
            webrtc.joinRoom(scope.chatRoom);
        });
    };
    scope.email = window.current_email || false;
    scope.loginlogout = function() {
        if (scope.email) {
            navigator.id.logout();
        } else {
            navigator.id.request();
        }
    };
    navigator.id.watch({
        loggedInUser: scope.email,
        onlogin: function(assertion) {
            var data = {
                assertion: assertion,
                audience: window.location.protocol + "//" + window.location.hostname + ":" + window.location.port
            };
            $http.post("/users/sign_in", data).success(function(data) {
                window.location.reload();
            });
        },
        onlogout: function() {
            $http.delete("/users/sign_out").success(function() {
                window.location.reload();
            });
        }
    });
    scope.searchLocation = null;
    scope.zoomTo = function(textloc) {
        console.log(textloc);
        $http.get("http://nominatim.openstreetmap.org/search?format=json&limit=5&q=" + textloc).success(function(data) {
            if (!data[0]) {
                scope.validLocation = "";
            } else {
                scope.validLocation = data[0].display_name;
                map.panTo([ data[0].lat, data[0].lon ]);
            }
        }).error(function(data) {
            scope.validLocation = "";
        });
    };
    scope.loadChatRoom = function() {
        var button, input;
        scope.fayeClient = new Faye.Client("/faye");
        scope.fayeClient.subscribe("/message/" + scope.chatRoom, function(payload) {
            $("ul#chat").append("<li>" + payload.email + " : " + payload.body + "</li>");
        });
        input = $("input#testinput");
        button = $("button#testpost");
        button.click(function() {
            var publication;
            button.attr("disabled", "disabled");
            button.text("Posting...");
            publication = scope.fayeClient.publish("/message/" + scope.chatRoom, {
                email: scope.email,
                channel: Math.round(scope.chatRoom),
                body: input.val(),
            });
            publication.callback(function() {
                input.val("");
                button.removeAttr("disabled");
                return button.text("Post");
            });
            return publication.errback(function() {
                button.removeAttr("disabled");
                return button.text("Try again");
            });
        });
    };
    scope.addChannel = function() {
        var data = {
            "name": scope.validLocation,
            "latitude": map.getCenter()["lat"],
            "longitude": map.getCenter()["lng"],
            "authenticity_token": $('meta[name=csrf-token]').attr('content')
        }

        $http.post("/chatrooms.json", data).success(function(data) {
            window.location.reload();
        });
    }
    window.angularScope = scope;
}).directive("appMarkdown", function() {
    var converter = new Showdown.converter();
    return {
        restrict: "AE",
        link: function(scope, element, attrs) {
            element.html(converter.makeHtml(element.text()));
        }
    };
});
