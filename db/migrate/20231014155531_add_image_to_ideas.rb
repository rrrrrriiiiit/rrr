class AddImageToIdeas < ActiveRecord::Migration[6.1]
  def change
    add_column :ideas, :image, :string
  end
end
