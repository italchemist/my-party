class Activity < ActiveRecord::Base
  belongs_to :party

  validates :name, :presence => true
end
