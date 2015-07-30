$ ->
  $('.good').on 'click', ->
    $(this).hide()
    $.colorbox({html:"<h1>カッパしました</h1><br><img src='/images/weey.png' width='370' height='320'><br><a href='#' class='btn btn-info' onclick='$.colorbox.close()'>閉じる</a>"});

    # かっぱ数を更新
    id_list = $(this).data('id')
    $target = $(".kappa#{id_list}")
    $target.html(parseInt($target.html())+1)

  $('.tanka-good').on 'click', ->
    $(this).hide()
    $.colorbox({html:"<h1>カッパしました</h1><br><img src='/images/weey.png' width='370' height='320'><br><a href='#' class='btn btn-info' onclick='$.colorbox.close()'>閉じる</a>"});

    # かっぱ数を更新
    id_list = $(this).data('id')
    $target = $(".kappa-tanka-#{id_list}")
    $target.html(parseInt($target.html())+1)
