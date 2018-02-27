// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"


let index_state = $('#index').is(":visible");
if(index_state == true) {
  $('#nav_home').addClass('active')
  $('table[role="datatable"]').dataTable({
    dom:
    "<'ui grid'"+
      "<'row'"+
        "<'eight wide column'l>"+
        "<'right aligned eight wide column'f>"+
      ">"+
      "<'row dt-table'"+
        "<'sixteen wide column'tr>"+
      ">"+
      "<'row'"+
        "<'seven wide column'i>"+
        "<'right aligned nine wide column'p>"+
      ">"+
    ">",
    renderer: 'semanticUI',
    pagingType: "full_numbers",
    language: {
    emptyTable:     "No Records Found!",
    zeroRecords:    "No Matching Records Found!",
    search:         "Search",
    paginate: {
      first: "<i class='angle single left icon'></i> First",
      previous: "<i class='angle double left icon'></i> Previous",
      next: "Next <i class='angle double right icon'></i>",
      last: "Last <i class='angle single right icon'></i>"
    }
    }
    });    
}


let about_state = $('#about').is(":visible");
if(about_state == true) {
  $('#nav_about').addClass('active')
}

let report_state = $('#report').is(":visible");
if(report_state == true) {
  $('#nav_report').addClass('active')
}