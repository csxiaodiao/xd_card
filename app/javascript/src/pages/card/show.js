import "weui"
import './show.scss'


window.___page__cards__show = function () {

  wx.ready(function () {
    wx.hideOptionMenu();

    console.log("into card show")

    $(".xd_card").on('click', function () {
      var $this = $(this);

      console.log($this.data('kind'));

      var kind = $this.data('kind');
      var imagePaths = [];
      imagePaths.push('/images/');
      imagePaths.push(kind);
      imagePaths.push('d.png');
      var imagePath = imagePaths.join('');
      console.log(imagePath);
      $.ajax({
        url: '/card/receive',
        method: "POST",
        data: { kind: kind },
        dataType: "json",
        beforeSend: function () {
          $this.removeClass('xd_card');
        },
        success: function (response) {
          let msg = response.msg
          let code = response.code
          console.log(response)
          if (code == '1111') {
            $this.attr('src', imagePath);
          }
          $('.receive_notice').text(msg);
          $('.js_dialog').fadeIn(200);
        },
        error: function (xhr, status, error) {
          alert(1);
          $this.addClass('xd_card');
        }
      });




    })


    $('.weui-dialog__btn').on('click', function () {
      $(this).parents('.js_dialog').fadeOut(200);
    });
  });

}
