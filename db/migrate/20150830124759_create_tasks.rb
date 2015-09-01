class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :date
      t.references :project, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
