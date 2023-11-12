class Like < ApplicationRecord
  belongs_to :idea
  belongs_to :user
  validates_uniqueness_of :idea_id, scope: :user_id
end
