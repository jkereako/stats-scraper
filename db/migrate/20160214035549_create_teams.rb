class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :league, null: false, default: ''
      t.string :conference, null: false, default: ''
      t.string :division, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :stats_identifier, null: false, default: ''

      t.timestamps
    end
  end
end
