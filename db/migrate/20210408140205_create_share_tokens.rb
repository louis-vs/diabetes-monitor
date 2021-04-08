# frozen_string_literal: true

class CreateShareTokens < ActiveRecord::Migration[6.1] # :nodoc:
  def change
    create_table :share_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token, null: false, default: ''
      t.integer :uses_remaining, null: false, default: 0

      t.index :token, unique: true

      t.timestamps
    end
  end
end
