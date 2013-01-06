class Performance < ActiveRecord::Base
  belongs_to :show
  has_a :venue
  has_many :seating_types, :as => :seatable, :order => 'id', :dependent => :destroy
  accepts_nested_attributes_for :seating_types, :allow_destroy => true

  validates_presence_of :start_datetime
  validates_uniqueness_of :start_datetime, :message => t('performances.same_start_time')

  validates_length_of :notes, :maximum => 500

  def date
    start_datetime.to_date
  end

  def time
    start_datetime.to_time
  end

  def reservable?
    !!reservable
  end

  def to_s
    start_datetime.strftime('%a %d %b %Y at %l:%M %p') + unless notes.nil?
      ' \u2014 %s' % notes
    else
      ''
    end
  end

end
