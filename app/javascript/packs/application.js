//--
// Copyright 2021 Louis Van Steene
//
// This file is part of diabetes-monitor.
//
// diabetes-monitor is free software: you can redistribute it and/or modify
// it under the terms of version 3 of the GNU General Public License as published by
// the Free Software Foundation.
//
// diabetes-monitor is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with diabetes-monitor.  If not, see <https://www.gnu.org/licenses/>.
//++


import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import LocalTime from 'local-time';

// jQuery, $, and Popper are provided as plugins in /config/webpack/environment.js

import 'bootstrap';
import ClipboardJS from 'clipboard';

import 'channels';

Rails.start();
Turbolinks.start();
ActiveStorage.start();
LocalTime.start();

// expose jQuery to js.erb views
window.$ = jQuery;

// function to add time zone data to forms
const addTimeZoneToForms = () => {
  $('.input-time-zone').val(Intl.DateTimeFormat().resolvedOptions().timeZone);
};

// do things when page loads
$(document).on('turbolinks:load', () => {
  let clipboard = new ClipboardJS('.copy-button');

  // clipboard.js: alert user about success or failure
  clipboard.on('success', () => {
    $('#alerts').html(`
      <div class="alert alert-success alert-dismissable fade show" role="alert">
        Copied to clipboard!
        <button type="button" class="close" data-dismiss="alert" aria-label="close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    `);
  });
  clipboard.on('error', () => {
    $('#alerts').html(`
      <div class="alert alert-danger alert-dismissable fade show" role="alert">
        Failed to copy to clipboard.
        <button type="button" class="close" data-dismiss="alert" aria-label="close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    `);
  });

  // add client time zone data to form
  addTimeZoneToForms();
});

// bootstrap collapse: change text on event
$(document).on('show.bs.collapse', (e) => {
  if(e.target.classList.contains('toggle-expand-text')) {
    // find the element which targets the expanded element
    let expandBtn = $(`[data-target="#${e.target.id}"]`);
    // change text
    expandBtn.html($(expandBtn).data('collapsetext'));
  }
});
$(document).on('hide.bs.collapse', (e) => {
  if(e.target.classList.contains('toggle-expand-text')) {
    // find the element which targets the collapsed element
    let collapseBtn = $(`[data-target="#${e.target.id}"]`);
    // change text
    collapseBtn.html($(collapseBtn).data('expandtext'));
  }
});

// fired before entry created, see /app/views/entries/create.js.erb
$(document).on('entries:create', () => {
  $('tr.table-success').removeClass('table-success');
});

// fire after entry created, see /app/views/entries/create.js.erb
$(document).on('entries:created', () => {
  addTimeZoneToForms();
});
