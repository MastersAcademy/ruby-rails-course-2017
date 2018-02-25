// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
var ready = function() {

    $('#products').DataTable({
        "columnDefs": [
            { "width": "19%", className: "dt-body-center", "targets": -1 },
            { "width": "10%", "targets": 0 },
            { "width": "7%", "targets": 1 },
            { "width": "20%", "targets": 2 },
            { "width": "20%", "targets": 3 },
        ]
    });

}

$(document).ready(ready);
$(document).on('page:load', ready);
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
