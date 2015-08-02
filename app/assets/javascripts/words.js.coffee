$ ->
  $('.good').on 'click', ->
    $(this).hide()
    $.colorbox({
      html: "<h2>カッパしました</h2><br><a href='#' class='btn btn-info' onclick='$.colorbox.close(); return false;'>閉じる</a><br><img src='/images/weey.png' width='370' height='320'><br><a href='#' class='btn btn-info' onclick='$.colorbox.close(); return false;'>閉じる</a>",
      maxWidth: '100%',
      maxHeight: '100%',
      speed: '200'
    });

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
