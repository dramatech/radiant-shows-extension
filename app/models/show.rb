class Show < ActiveRecord::Base
  has_many :seating_types, :as => :seatable, :order => 'id', :dependent => :destroy
  has_many :performances, :order => 'start_datetime', :dependent => :destroy
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

  def reservation_threshold
    threshold_seconds / 3600
  end

  def length
    length_seconds / 60
  end

  def reservations_open_day
    reservations_open.day
  end

  def reservations_open_month
    Date::ABBR_MONTHNAMES[reservations_open.month]
  end

  def reservations_open_year
    reservations_open.year
  end

  def reservations_close_day
    reservations_close.day
  end

  def reservations_close_month
    Date::ABBR_MONTHNAMES[reservations_close.month]
  end

  def reservations_close_year
    reservations_close.year
  end

  def reservations_open_day=(day)
    reservations_open = Date.new(reservations_open.year, reservations_open.month, day)
  end

  def reservations_open_month=(month)
    reservations_open = Date.new(reservations_open.year,
                        month.is_a?(String) ? Date::ABBR_MONTHNAMES.index(month) : month,
                        reservations_open.day)
  end

  def reservations_open_year=(year)
    reservations_open = Date.new(year, reservations_open.month, reservations_open.day)
  end

  def reservations_close_day=(day)
    reservations_close = Date.new(reservations_close.year, reservations_close.month, day)
  end

  def reservations_close_month=(month)
    reservations_close = Date.new(reservations_close.year,
                        month.is_a?(String) ? Date::ABBR_MONTHNAMES.index(month) : month,
                        reservations_close.day)
  end

  def reservations_close_year=(year)
    reservations_close = Date.new(year, reservations_close.month, reservations_close.day)
  end

  def to_s
    '%{author}\'s "%{title}" directed by %{director}' % { :title => title, :author => author, :director => director }
  end

end
