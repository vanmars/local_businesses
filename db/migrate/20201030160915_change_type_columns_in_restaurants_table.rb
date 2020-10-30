class ChangeTypeColumnsInRestaurantsTable < ActiveRecord::Migration[5.2]
  def change
    change_table :restaurants do |t|
      t.rename :type, :kind
    end
  end
end
