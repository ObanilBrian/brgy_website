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

  $('.frm_blotter')
  .form({
    fields: {
      'blotter[c_first_name]' : 'empty',
      'blotter[c_middle_name]' : 'empty',
      'blotter[c_last_name]' : 'empty',
      'blotter[c_address]' : 'empty',
      'blotter[c_phone]' : ['exactLength[11]', 'empty'],
      'blotter[r_first_name]' : 'empty',
      'blotter[r_middle_name]' : 'empty',
      'blotter[r_last_name]' : 'empty',
      'blotter[r_address]' : 'empty',
      'blotter[r_phone]' : ['exactLength[11]', 'empty'],
      'blotter[case]' : 'empty',
      'blotter[description]' : 'empty'
    }
  });
}

let user_state = $('#user').is(":visible");
if(user_state == true) {
  $('#nav_admin').addClass('active')

  $('#pass_toggle').click(function(){
    if($('input[name="user[password]"]').attr('type') == "password"){
      $('input[name="user[password]"]').attr('type', 'text')
    } else {
      $('input[name="user[password]"]').attr('type', 'password')
    }
  })

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

  $('.frm_user')
  .form({
    fields: {
      'user[first_name]' : 'empty',
      'user[middle_name]' : 'empty',
      'user[last_name]' : 'empty',
      'user[username]' : 'empty',
      'user[password]' : ['minLength[6]', 'empty']
    }
  });
}

let blotter_state = $('#blotter').is(":visible");
if(blotter_state == true) {
  $('#nav_admin').addClass('active')

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

  $('.frm_user')
  .form({
    fields: {
      'user[first_name]' : 'empty',
      'user[middle_name]' : 'empty',
      'user[last_name]' : 'empty',
      'user[username]' : 'empty',
      'user[password]' : ['minLength[6]', 'empty']
    }
  });
}

let official_state = $('#official').is(":visible");
if(official_state == true) {
  $('#nav_admin').addClass('active')


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

  $('.frm_official')
  .form({
    fields: {
      'official[first_name]' : 'empty',
      'official[middle_name]' : 'empty',
      'official[last_name]' : 'empty',
      'official[position]' : 'empty'
    }
  });
}
