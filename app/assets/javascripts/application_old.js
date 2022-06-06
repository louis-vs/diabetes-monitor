//--
// Copyright 2021 Louis Van Steene
//
// This file is part of diabetes-monitor.
//
// diabetes-monitor is free software: you can redistribute it and/or modify
// it under the terms of version 3 of the GNU Affero General Public License as
// published by the Free Software Foundation.
//
// diabetes-monitor is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
// or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public
// License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with diabetes-monitor.  If not, see <https://www.gnu.org/licenses/>.
//++


// do things when page loads
// $(document).on('turbolinks:load', () => {
//   let clipboard = new ClipboardJS('.copy-button');
//
//   // clipboard.js: alert user about success or failure
//   clipboard.on('success', () => {
//     $('#alerts').html(`
//       <div class="alert alert-success alert-dismissable fade show" role="alert">
//         Copied to clipboard!
//         <button type="button" class="close" data-dismiss="alert" aria-label="close">
//           <span aria-hidden="true">&times;</span>
//         </button>
//       </div>
//     `);
//   });
//   clipboard.on('error', () => {
//     $('#alerts').html(`
//       <div class="alert alert-danger alert-dismissable fade show" role="alert">
//         Failed to copy to clipboard.
//         <button type="button" class="close" data-dismiss="alert" aria-label="close">
//           <span aria-hidden="true">&times;</span>
//         </button>
//       </div>
//     `);
//   });
// });

// fired when entry created, see /app/views/entries/create.js.erb
// $(document).on('entries:create', () => {
//   $('tr.table-success').removeClass('table-success');
// });
