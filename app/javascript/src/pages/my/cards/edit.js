import './edit.scss'

window.___page__my__cards__edit = function () {
  $('.weui-dialog__btn').on('click', function () {
    $(this).parents('.js_dialog').fadeOut(200);
  });
}