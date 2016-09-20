//= require nprogress
//= require i18n/translations
//= require fluent/admin/nprogress-wiselinks.js
//= require fluent/admin/global
//= require fluent/admin/menu_admin.js.coffee
//= require ckeditor/init
//= require fluent/admin/ckeditor

NProgress.configure({ showSpinner: false });
$(document).on('page:load', function () {
    $('a#tooltip').tooltip()
});

$(document).ready(function () {
    is_Firefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
    if(!is_Firefox) {
        window.wiselinks = new Wiselinks($('.content'));
    }
})