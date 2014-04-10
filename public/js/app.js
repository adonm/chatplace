"use strict";

angular.module("chatplace", [ "mgcrea.ngStrap" ]).run(function($rootScope, $location) {
    $rootScope.location = $location;
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
        var map = L.map("map").setView([ position.coords.latitude, position.coords.longitude ], 12);
        // add an OpenStreetMap tile layer
        L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        angular.element(document.getElementById("mapLoadText")).remove();
    };
    $rootScope.loadMap = function() {
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(loadLeaflet);
        } else {
            setTimeout(loadLeaflet, 50);
        }
    };
    $rootScope.loadWebRTC = function() {
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
            webrtc.joinRoom("defaultRoom");
        });
    };
}).directive("appMarkdown", function() {
    var converter = new Showdown.converter();
    return {
        restrict: "AE",
        link: function(scope, element, attrs) {
            element.html(converter.makeHtml(element.text()));
        }
    };
});