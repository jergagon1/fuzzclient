## Visual styles for Google Maps
#FuzzAppMapStyles = [
#  {
#    'featureType': 'landscape.man_made'
#    'elementType': 'geometry'
#    'stylers': [ { 'color': '#f7f1df' } ]
#  }
#  {
#    'featureType': 'landscape.natural'
#    'elementType': 'geometry'
#    'stylers': [ { 'color': '#d0e3b4' } ]
#  }
#  {
#    'featureType': 'landscape.natural.terrain'
#    'elementType': 'geometry'
#    'stylers': [ { 'visibility': 'off' } ]
#  }
#  {
#    'featureType': 'poi'
#    'elementType': 'labels'
#    'stylers': [ { 'visibility': 'off' } ]
#  }
#  {
#    'featureType': 'poi.business'
#    'elementType': 'all'
#    'stylers': [ { 'visibility': 'off' } ]
#  }
#  {
#    'featureType': 'poi.medical'
#    'elementType': 'geometry'
#    'stylers': [ { 'color': '#fbd3da' } ]
#  }
#  {
#    'featureType': 'poi.park'
#    'elementType': 'geometry'
#    'stylers': [ { 'color': '#bde6ab' } ]
#  }
#  {
#    'featureType': 'road'
#    'elementType': 'geometry.stroke'
#    'stylers': [ { 'visibility': 'off' } ]
#  }
#  {
#    'featureType': 'road'
#    'elementType': 'labels'
#    'stylers': [ { 'visibility': 'off' } ]
#  }
#  {
#    'featureType': 'road.highway'
#    'elementType': 'geometry.fill'
#    'stylers': [ { 'color': '#ffe15f' } ]
#  }
#  {
#    'featureType': 'road.highway'
#    'elementType': 'geometry.stroke'
#    'stylers': [ { 'color': '#efd151' } ]
#  }
#  {
#    'featureType': 'road.arterial'
#    'elementType': 'geometry.fill'
#    'stylers': [ { 'color': '#ffffff' } ]
#  }
#  {
#    'featureType': 'road.local'
#    'elementType': 'geometry.fill'
#    'stylers': [ { 'color': 'black' } ]
#  }
#  {
#    'featureType': 'transit.station.airport'
#    'elementType': 'geometry.fill'
#    'stylers': [ { 'color': '#cfb2db' } ]
#  }
#  {
#    'featureType': 'water'
#    'elementType': 'geometry'
#    'stylers': [ { 'color': '#a2daf2' } ]
#  }
#]
#
#
## Edit map options to:
##  center: pin location for the single marker and average for several markers
##  zoom: don't know how, but need to be calculated to show all markers on the view area. Initial zoom point: 14
#mapOptions =
#  zoom: 14
#  center: new (google.maps.LatLng)(37.801, -122.28)
#  styles: FuzzAppMapStyles
#  mapTypeControl: false
#  streetViewControl: false
#  scrollwheel: false
#
#
##
##  mapSingle
##
#
#
## Initialization of lost pet map
#lostPetMapDOM = $('mapSingle.pin-orange')[0]
#lostPetMap = new google.maps.Map(lostPetMapDOM, mapOptions)
#
#lostPetMarker = new (google.maps.Marker)(
#  position:
#    lat: 37.802
#    lng: -122.28
#  map: lostPetMap
#  icon: '/assets/images/app/map/lost-pin.png'
#  draggable: true)
#
#
## Initialization of found pet map
#foundPetMapDOM = $('mapSingle.pin-green')[0]
#foundPetMap = new google.maps.Map(foundPetMapDOM, mapOptions)
#
#lostPetMarker = new (google.maps.Marker)(
#  position:
#    lat: 37.802
#    lng: -122.28
#  map: lostPetMap
#  icon: '/assets/images/app/map/lost-pin.png'
#  draggable: true)
#
#
#
##
##  mapMultiple
##
#
#sightingsMapDOM = $('mapMultiple')[0]
#sightingsMap = new (google.maps.Map)(sightingsMapDOM, mapOptions)
#
##Defining coordinates and creating map markers
#lostMarkersArray = [
#  [
#    37.807560843059925
#    -122.27261856079099
#  ]
#  [
#    37.80762865563491
#    -122.28343322753904
#  ]
#  [
#    37.803627607163115
#    -122.28180244445798
#  ]
#  [
#    37.796438738238166
#    -122.28506401062009
#  ]
#  [
#    37.79589615369872
#    -122.298196105957
#  ]
#]
#
#lostMarkersArray.forEach (item, i) ->
#  new (google.maps.Marker)(
#    position:
#      lat: item[0]
#      lng: item[1]
#    map: sightingsMap
#    icon: '/assets/images/app/map/lost-pin.png'
#    draggable: false
#    opacity: (10 - i) / 10)
#  return
#
#foundMarkersArray = [
#  [
#    37.80810334191614
#    -122.29553535461423
#  ]
#  [
#    37.80444139729422
#    -122.28617980957029
#  ]
#  [
#    37.79569268346904
#    -122.27133110046384
#  ]
#]
#
#foundMarkersArray.forEach (item, i) ->
#  new (google.maps.Marker)(
#    position:
#      lat: item[0]
#      lng: item[1]
#    map: sightingsMap
#    icon: '/assets/images/app/map/found-pin.png'
#    draggable: false
#    opacity: (10 - i) / 10)
#  return
#
#
##
##  mapTrack
##
#
##Creating track
#polyCoordinates = []
#lostMarkersArray.forEach (item) ->
#  polyCoordinates.push
#    lat: item[0]
#    lng: item[1]
#  return
#
##Defining markers
#circleSymbolOrange =
#  path: google.maps.SymbolPath.CIRCLE
#  fillOpacity: 1
#  fillColor: '#E57E0F'
#  scale: 7
#  strokeColor: '#E57E0F'
#
#circleStartSymbolOrange =
#  path: google.maps.SymbolPath.CIRCLE
#  fillOpacity: 1
#  fillColor: '#FFF'
#  scale: 9
#  strokeColor: '#E57E0F'
#
#circleSymbolGreen =
#  path: google.maps.SymbolPath.CIRCLE
#  fillOpacity: 1
#  fillColor: '#1E9F84'
#  scale: 7
#  strokeColor: '#1E9F84'
#circleStartSymbolGreen =
#  path: google.maps.SymbolPath.CIRCLE
#  fillOpacity: 1
#  fillColor: '#FFF'
#  scale: 9
#  strokeColor: '#1E9F84'
#
#
##Applying maps
#lostPostMapDOM = $('mapMultiple.pin-orange')[0]
#lostPostMap = new (google.maps.Map)(lostPostMapDOM, mapOptions)
#foundPostMapDOM = $('mapMultiple.pin-green')[0]
#foundPostMap = new (google.maps.Map)(foundPostMapDOM, mapOptions)
#
#lostPostMapPath = new (google.maps.Polyline)(
#  path: polyCoordinates
#  geodesic: true
#  strokeColor: '#E57E0F'
#  strokeOpacity: 1.0
#  strokeWeight: 3
#  map: lostPostMap)
#
#foundPostMapPath = new (google.maps.Polyline)(
#  path: polyCoordinates
#  geodesic: true
#  strokeColor: '#1E9F84'
#  strokeOpacity: 1.0
#  strokeWeight: 3
#  map: foundPostMap)
#
#arrayCoodinates1.forEach (item, i) ->
#  if i == 0
#    new MarkerWithLabel(
#      position:
#        lat: item[0]
#        lng: item[1]
#      map: lostPostMap
#      icon: circleStartSymbolOrange
#      draggable: false)
#  else
#    new (google.maps.Marker)(
#      position:
#        lat: item[0]
#        lng: item[1]
#      map: lostPostMap
#      icon: circleSymbolOrange
#      draggable: false
#      label: i.toString())
#  return
#
#arrayCoodinates1.forEach (item, i) ->
#  if i == 0
#    new MarkerWithLabel(
#      position:
#        lat: item[0]
#        lng: item[1]
#      map: foundPostMap
#      icon: circleStartSymbolGreen
#      draggable: false)
#  else
#    new (google.maps.Marker)(
#      position:
#        lat: item[0]
#        lng: item[1]
#      map: foundPostMap
#      icon: circleSymbolGreen
#      draggable: false
#      label: i.toString())
#  return