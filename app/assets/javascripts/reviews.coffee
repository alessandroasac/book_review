ready = ->
  $('#rating-form').raty
    path: '/assets/raty-2.7.1/',
    scoreName: 'review[rating]',

# $(document).ready(ready)
$(document).on('turbolinks:load', ready)
