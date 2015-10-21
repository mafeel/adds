class Add < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: :slugged
	belongs_to :user

	validates :title, presence: true, length: { minimum: 1 }
	validates :body, presence: true, length: { minimum: 1 }
end
