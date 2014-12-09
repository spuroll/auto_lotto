class NumberSet < ActiveRecord::Base
  belongs_to :user
  has_many :emails
  
  validates :set, presence: true, length: {minimum: 17, maximum: 17}

end
