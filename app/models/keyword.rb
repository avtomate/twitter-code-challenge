class Keyword < ActiveRecord::Base
  has_many :tweets

  validates :content, presence: true
                      length: { minimum: 2 }
end
