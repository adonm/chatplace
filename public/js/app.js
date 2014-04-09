angular.module("chatplace", [ "mgcrea.ngStrap" ]).run(function($rootScope, $location) {
    $rootScope.location = $location;
    loadLeaflet = function(position) {
        if (position == undefined) {
            var position = {
                coords: {
                    longitude: 115.8589,
                    latitude: -31.9522
                }
            };
        }
        // create a map in the "map" div, set the view to a given place and zoom
        var map = L.map("map").setView([ position.coords.latitude, position.coords.longitude ], 13);
        // add an OpenStreetMap tile layer
        L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png", {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        // add a marker in the given location, attach some popup content to it and open the popup
        L.marker([ 51.5, -.09 ]).addTo(map).bindPopup("A pretty CSS3 popup. <br> Easily customizable.").openPopup();
    };
    $rootScope.loadMap = function() {
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(loadLeaflet);
        } else {
            setTimeout(loadLeaflet, 50);
        }
    };
});