class Venue < ActiveRecord::Base
  serialize :seating_sections, Array
  default_scope :order => 'name'

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end

end
