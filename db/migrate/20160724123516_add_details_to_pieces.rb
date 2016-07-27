class AddDetailsToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :name, :string
    add_column :pieces, :artist, :string
    add_column :pieces, :price, :decimal
    add_column :pieces, :birthdate, :integer
    add_column :pieces, :deathdate, :integer
    add_column :pieces, :area, :decimal
  end
end
