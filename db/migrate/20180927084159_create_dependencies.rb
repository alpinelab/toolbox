# frozen_string_literal: true

class CreateDependencies < ActiveRecord::Migration[5.2]
  def change
    create_table :dependencies do |t|
      t.string :name

      t.timestamps
    end
  end
end
