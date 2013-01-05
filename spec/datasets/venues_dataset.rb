class VenuesDataset < Dataset::Base
  def load
    Venue.create!(:name => 'Black Box')
    Venue.create!(:name => 'Ferst Center')
  end
end
