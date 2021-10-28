//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require moment
//= require tempusdominus-bootstrap-4
//= require moment/zh-cn.js

$(document).ready(function() {
  $(function() {
    $(".image-view").popover({html: true, trigger: "hover"});
  });

  $('.date-picker').each(function(i, e) {
    var defaultDate = $(e).val();
    $(e).attr('data-toggle', 'datetimepicker');
    $(e).attr('data-target', '#' + $(e).attr('id'));

    $(e).datetimepicker({
      format: "YYYY-MM-DD",
      date: defaultDate,
      sideBySide: true,
      locale: 'zh-CN',
    })
  });

  $('.time-picker').each(function(i, e) {
    var defaultDate = $(e).val();
    $(e).attr('data-toggle', 'datetimepicker');
    $(e).attr('data-target', '#' + $(e).attr('id'));

    $(e).datetimepicker({
      format: "YYYY-MM-DD HH:mm:ss",
      date: defaultDate,
      sideBySide: true,
      locale: 'zh-CN',
    })
  });
})
