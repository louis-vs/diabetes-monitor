# frozen_string_literal: true

# @abstract Custom base class for records
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
