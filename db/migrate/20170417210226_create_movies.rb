class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :small_image
      t.string :large_image
      t.string :rating

      t.timestamps
    end
  end
end
