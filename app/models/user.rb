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

# A record for a Devise user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  # @!attribute [rw] entires
  #   @return [ActiveRecord::Relation] the entries which which this user is associated
  has_many :entries, dependent: :destroy
  # @!attribute [rw] share_tokens
  #   @return [ActiveRecord::Relation] the share tokens which which this user is associated
  has_many :share_tokens, dependent: :destroy
  # @!attribute [rw] email
  #   @return [String] the user's email address
  # @!attribute [rw] name
  #   @return [String] the user's name

  validates :terms_of_service, acceptance: true
end
