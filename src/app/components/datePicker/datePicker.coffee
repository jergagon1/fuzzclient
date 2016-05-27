angular.module('fuzzApp').component 'datePicker',
  templateUrl: 'app/components/datePicker/partials/datePicker.html'
  controller: ()->
    $.mask.definitions['A'] = '[APap]'
    $.mask.definitions['1'] = '[01]'
    $.mask.definitions['3'] = '[0123]'
    $.mask.definitions['5'] = '[012345]'
    $('date-picker input').mask '19/39 19:59 AM',
      autoclear: false
      completed: ->
        inputDate = @val()
        mm = parseInt(inputDate.substring(0, 2))
        dd = parseInt(inputDate.substring(3, 5))
        h = parseInt(inputDate.substring(6, 8))
        m = parseInt(inputDate.substring(9, 11))
        am = inputDate.substring(12)
        mm = if mm <= 12 then mm else 12
        dd = if dd <= 31 then mm else 31
        h = if h <= 12 then h else 12
        m = if m <= 59 then m else 59
        am = am.toUpperCase()
        @val mm + '/' + dd + ' ' + h + ':' + m + ' ' + am
        return

    $('.dropdown .dropdown-menu li a').click ->
      $a = $(this)
      $aText = $(this).text()
      counter = 0
      while $aText[counter] == String.fromCharCode(160)
        counter++
      $aText = $aText.substring(counter)
      $a.parents('.dropdown').find('.dropdown-toggle').text $aText
      return

    #Toggle dropdown to custom input date
    $('.custom-date-trigger').click ->
      $(this).parents('form').addClass 'custom-date'
      return