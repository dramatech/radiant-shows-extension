class Venue < ActiveRecord::Base
  has_many :seating_types, :as => :seatable, :order => 'id', :dependent => :destroy
  accepts_nested_attributes_for :seating_types, :allow_destroy => true

  default_scope :order => 'name'

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_length_of :name, :maximum => 255

  def to_s
    name
  end

end
