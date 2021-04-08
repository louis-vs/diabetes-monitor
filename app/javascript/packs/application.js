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

import 'bootstrap';
import ClipboardJS from 'clipboard';

import 'channels';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// expose jQuery to js.erb views
window.$ = jQuery;

// do things when page loads
$(document).on('turbolinks:load', () => {
  new ClipboardJS('.copy-button');
});

// bootstrap collapse: change text on event
$(document).on('show.bs.collapse', (e) => {
  if(e.target.classList.contains('toggle-expand-text')) {
    // find the element which targets the expanded element
    let expandBtn = $(`[data-target="#${e.target.id}"]`)[0];
    // change text
    expandBtn.innerHTML = $(expandBtn).data('collapsetext');
  }
});
$(document).on('hide.bs.collapse', (e) => {
  if(e.target.classList.contains('toggle-expand-text')) {
    // find the element which targets the collapsed element
    let collapseBtn = $(`[data-target="#${e.target.id}"]`)[0];
    // change text
    collapseBtn.innerHTML = $(collapseBtn).data('expandtext');
  }
});

// fired when entry created
$(document).on('entries:create', () => {
  $('tr.table-success').removeClass('table-success');
});
