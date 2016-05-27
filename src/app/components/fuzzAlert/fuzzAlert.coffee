angular.module('fuzzApp').component 'fuzzAlert',
  templateUrl: 'app/components/fuzzAlert/partials/fuzzAlert.html'
  controller: ()->
    @alertsIndex = [
      {
        title: "Lost Dog"
        lastSeen: new Date()
        author: "Sarah"
      }
      {
        title: "Lost Cat"
        lastSeen: new Date()
        author: "Sarah"
      }
      {
        title: "Lost Bird"
        lastSeen: new Date()
        author: "Sarah"
      }
      {
        title: "Lost Dog"
        lastSeen: new Date()
        author: "Sarah"
      }
      {
        title: "Lost Cat"
        lastSeen: new Date()
        author: "Sarah"
      }
      {
        title: "Lost Bird"
        lastSeen: new Date()
        author: "Sarah"
      }
    ]
    @