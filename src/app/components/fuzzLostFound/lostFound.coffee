angular.module('fuzzApp').component 'lostFound',
  templateUrl: 'app/components/fuzzLostFound/partials/lostFound.html'
  bindings:
    type='@'
  controller: ($scope, $attrs, FuzzMap, uiGmapGoogleMapApi, Upload)->
    @formType = $attrs.type
    @openedModal = null
    @map = false
    @lastLocation = ''
    @locations =
      lost:
        name: ''
        details: null
      found:
        name: ''
        details: null
    @files = []
    @foundFiles = []
    #variables for describe pet form
    @extraDetails = false

    @upload = (file)->
      #TODO: Preview thumb and Api call
      #Upload.upload({
      #  url: 'upload/url',
      #  data: {file: file}
      #}).then (res)->
      #  console.log('Success ' + res.config.data.file.name + 'uploaded. Response: ' + res.data)

    @uploadMultiple = (files)->
      if files && files.length
        for file in files
          @upload(file)

    #send i lost pet data to api
    @submitForm = (formName)->
      if @[formName].$valid
        @closeModals()

    #Stupid watchers are required :(
    $scope.$watch 'finder.locations.lost.details', (details)=>
      currentLocation = @locations.lost.name
      if details && currentLocation != @lastLocation
        @map = FuzzMap.setCenter details.geometry.location
        @lastLocation = currentLocation

    #Async google load
    uiGmapGoogleMapApi.then =>
      FuzzMap.getMapSettings().then (res)=>
        @map = res

    @showDetailsForm = ()->
      @extraDetails = true
    @
