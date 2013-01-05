class SeatingType < ActiveRecord::Base
  belongs_to :seatable, :polymorphic => true

  validates_presence_of :name

  def to_s
    name
  end

end
