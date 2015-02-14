class Subgroup < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: { scope: :group_id,
    message: "Subgroup exists!" }
	belongs_to :group
	has_many :clients, dependent: :destroy
end
