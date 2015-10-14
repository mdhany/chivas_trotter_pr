// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery-migrate-1.2.1.min
//= require jquery-ui-1.10.3.custom.min
//= require bootstrap/js/bootstrap.min
//= require bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min
//= require jquery-slimscroll/jquery.slimscroll.min
//= require jquery.blockui.min
//= require jquery.cookie.min
//= require uniform/jquery.uniform.min
//= require admin/app
//= require list
//= require grayscale
//= require jquery.easing.min
//= require jquery.fancybox
//= require happy
//= require happy.methods
// require jquery.validate
//= require_self


$(document).ready(function () {
    $('#consumidor').isHappy({
        fields: {
            // reference the field you're talking about, probably by `id`
            // but you could certainly do $('[name=name]') as well.
            '#name': {
                required: true,
                message: 'Inserta tu nombre'
            },
            '#identification': {
                required: true,
                message: 'Inserta tu identificación, cedula o pasaporte'
            },
            '#birth__3i': {
                required: true,
                message: 'Inserta tu dia de nacimiento'
            },
            '#birth__2i': {
                required: true,
                message: 'Inserta tu mes de nacimiento'
            },
            '#birth__1i': {
                required: true,
                message: 'Inserta tu año de nacimiento'
            },
            '#email': {
                required: true,
                message: 'Inserta un email valido.',
                test: happy.email // this can be *any* function that returns true or false
            },
            '#picture': {
                required: true,
                message: 'Inserta una imagen de tu factura.'
            },
            '#number': {
                required: true,
                message: 'Inserta la numeracion de tu factura'
            }
        }
    });
});

$ = jQuery.noConflict();