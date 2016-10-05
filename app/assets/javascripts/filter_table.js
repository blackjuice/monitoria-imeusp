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
//= require fancybox
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require_tree .

var table = document.getElementById("users_table");
var users_by_role = {};
users_by_role["student"] = [];
users_by_role["professor"] = [];

for (var i = 1; i < table.rows.length; i++) {
  var row = table.rows[i];
  var course_name = row.cells[1].innerHTML;
  var columns = {professor: row.cells[0].innerHTML, course: course_name, number: row.cells[2].innerHTML, semester: row.cells[3].innerHTML, button: row.cells[4].innerHTML };
  courses_by_department[course_name.substring(0, 3)].push(columns);
  courses_by_department["ALL"].push(columns);
}

update_table("ALL");

function update_table(dep) {
  for (var i = 1; i < table.rows.length; i++) {
    for (var j = 0; j < table.rows[i].cells.length; j++) {
      table.rows[i].cells[j].innerHTML = "";
    }
  }

  for (var i = 0; i < courses_by_department[dep].length; i++) {
    table.rows[i+1].cells[0].innerHTML = courses_by_department[dep][i].professor;
    table.rows[i+1].cells[1].innerHTML = courses_by_department[dep][i].course;
    table.rows[i+1].cells[2].innerHTML = courses_by_department[dep][i].number;
    table.rows[i+1].cells[3].innerHTML = courses_by_department[dep][i].semester;
    table.rows[i+1].cells[4].innerHTML = courses_by_department[dep][i].button;
  }
}