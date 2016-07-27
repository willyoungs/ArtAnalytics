class Piece < ApplicationRecord
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  def self.artists
    Piece.uniq.pluck(:artist)
  end
end
