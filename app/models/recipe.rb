class Recipe < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
	has_many :recipe_comments, dependent: :destroy

	attachment :smoothie_image, destroy: false

	validates :title, :catchphrase, :ingredient, :method, presence: true

	def favorited_by?(user)
	favorites.where(user_id: user.id).exists?
	end
end
