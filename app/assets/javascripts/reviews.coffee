ready = ->
  $('#rating-form').raty
    path: '/assets/raty-2.7.1/',
    scoreName: 'review[rating]',
    score: ->
      $(this).attr 'data-score'

# $(document).ready(ready)
$(document).on('turbolinks:load', ready)
