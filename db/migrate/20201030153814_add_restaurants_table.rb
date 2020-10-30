class AddRestaurantsTable < ActiveRecord::Migration[5.2]
  def change
    
    create_table :restaurants do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :review
      t.timestamps
    end

    create_table :shops do |t|
      t.string :name
      t.string :industry
      t.string :logo_url
      t.string :slogan
      t.timestamps
    end

  end
end
