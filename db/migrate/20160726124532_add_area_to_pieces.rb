class AddAreaToPieces < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :area, :decimal
  end
end
