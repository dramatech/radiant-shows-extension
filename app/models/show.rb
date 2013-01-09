class Show < ActiveRecord::Base
  has_many :seating_types, :as => :seatable, :order => 'id', :dependent => :destroy
  has_many :performances, :dependent => :destroy
  has_many :venues, :through => :performances
  accepts_nested_attributes_for :seating_types, :allow_destroy => true
  accepts_nested_attributes_for :performances, :allow_destroy => true

  validates_presence_of :title

  validates_length_of :title, :maximum => 255
  validates_length_of :author, :maximum => 255
  validates_length_of :director, :maximum => 255
  validates_length_of :notes, :maximum => 500
  validates_length_of :description, :maximum => 500

  def reservable?
    !!reservable
  end

  def reservations_open_string=(date)
    reservations_open = Date.parse(date)
  end

  def reservations_close_string=(date)
    reservations_close = Date.parse(date)
  end

  def hours_for_select
    Array(1..12).collect { |i| ["#{i} hour" + (i != 1 ? 's' : ''), i * 3600] }
  end

  def to_s
    '%{author}\'s "%{title}" directed by %{director}' % { :title => title, :author => author, :director => director }
  end

end
