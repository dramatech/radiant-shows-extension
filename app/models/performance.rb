class Performance < ActiveRecord::Base
  belongs_to :show
  has_one :venue
  has_many :seating_types, :as => :seatable, :order => 'id', :dependent => :destroy
  accepts_nested_attributes_for :seating_types, :allow_destroy => true

  validates_presence_of :start_datetime
  validates_uniqueness_of :start_datetime, :message => t('performances.same_start_time')

  validates_length_of :notes, :maximum => 500

  def reservable?
    !!reservable
  end

  def start_string=(val)
    self.start_datetime = DateTime.parse(val)
  end

  def start_string
    unless self.start_datetime.nil?
      I18n.l(self.start_datetime, :format => :long)
    else
      t('performances.no_performance_date_error')
    end
  end

  def to_s
    start_datetime.strftime('%a %d %b %Y at %l:%M %p') + unless notes.nil?
      ' \u2014 %s' % notes
    else
      ''
    end
  end

end
