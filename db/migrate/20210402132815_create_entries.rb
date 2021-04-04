# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[6.1] # :nodoc:
  def change
    create_table :entries do |t|
      t.datetime :time, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.decimal :blood_sugar, null: false, default: 0
      t.decimal :insulin, null: false, default: 0
      t.integer :tag, null: false, default: 0
      t.text :notes, null: false, default: '', limit: 512
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
