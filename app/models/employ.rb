class Employ < ActiveRecord::Base
  belongs_to :organization
  has_many :employments
  validates :organization_id, presence:true
end
