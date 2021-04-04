// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';

import 'bootstrap';

import 'channels';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// expose jQuery to js.erb views
window.$ = jQuery;

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
