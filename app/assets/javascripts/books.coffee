ready = ->
  $('.review-rating').raty
    readOnly: true,
    path: '/assets/raty-2.7.1/',
    score: ->
      $(this).attr 'data-score'

# $(document).ready(ready)
$(document).on('turbolinks:load', ready)
