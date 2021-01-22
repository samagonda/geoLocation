import QtQuick 2.0
import QtPositioning 5.2
import QtQuick.Controls 1.4
import QtLocation 5.3

Item {
    id: name

    property real lat
    property real lang
    Plugin
    {
        id: mapPlugin
        name: "mapboxgl"
    }
    PositionSource {
        id: src
        updateInterval: 1000
        active: true
        preferredPositioningMethods: PositionSource.SatellitePositioningMethods
        onPositionChanged: {
            var coord = src.position.coordinate;
            lat=coord.latitude;
            lang=coord.longitude;
            console.log("Coordinate:", coord.longitude, coord.latitude);
        }
    }
    Map
    {
        id:map
        anchors.fill: parent
        gesture.enabled: true
        gesture.acceptedGestures: MapGestureArea.PinchGesture | MapGestureArea.PanGesture
        plugin: mapPlugin
        center: QtPositioning.coordinate(lang,lat)
        zoomLevel: 14
        onCenterChanged:
        {

                console.log("The new latitude is ",map.center.latitude)
                console.log("The new longitude is ",map.center.longitude)

        }

    }

}

