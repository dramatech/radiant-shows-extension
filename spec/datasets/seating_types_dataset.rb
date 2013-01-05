class SeatingTypesDataset < Dataset::Base
  uses :venues

  def load
    SeatingType.create(:name => 'General', :capacity => 10, :seatable_id => 2, :seatable_type => 'Venue')
    SeatingType.create(:name => 'Reconfigurable', :seatable_id => 2, :seatable_type => 'Venue')
    SeatingType.create(:name => 'Floating')
  end
end
