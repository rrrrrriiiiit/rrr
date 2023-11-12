class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :place
      t.integer :people
      t.text :review

      t.timestamps
    end
  end
end
