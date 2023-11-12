class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :ideas, dependent: :destroy 
         validates :name, presence: true
         validates :profile, length: { maximum: 200 }

         has_many :likes, dependent: :destroy
         has_many :liked_ideas, through: :likes, source: :idea
         has_many :comments, dependent: :destroy
         def already_liked?(idea)
          self.likes.exists?(idea_id: idea.id)
        end
         
end
