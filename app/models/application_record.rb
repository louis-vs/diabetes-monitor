# frozen_string_literal: true

#--
# Copyright 2021 Louis Van Steene
#
# This file is part of diabetes-monitor.
#
# diabetes-monitor is free software: you can redistribute it and/or modify
# it under the terms of version 3 of the GNU Affero General Public License as
# published by the Free Software Foundation.
#
# diabetes-monitor is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with diabetes-monitor.  If not, see <https://www.gnu.org/licenses/>.
#++

# @abstract Custom base class for records
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
