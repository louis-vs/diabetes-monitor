// Entry point for the build script in your package.json
import '@hotwired/turbo-rails'
import './controllers'
import 'bootstrap'
import $ from 'jquery'


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
