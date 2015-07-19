$ ->
  options = 
    autoResize: true
    container: $('.container')
    offset: 2
    itemWidth: 210


  #$('.wook li').hide()
  #$('.wook li').wookmark(options)

  $('.good').click ->
    $(this).html('カッパしました')
