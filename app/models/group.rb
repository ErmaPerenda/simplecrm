class Group < ActiveRecord::Base
	validates :name, presence: true, :on=>[:update, :create]
	validates :name, uniqueness: { scope: :user_id,
    message: "Group exists!" }, :on=>[:update, :create]
  	belongs_to :user
  	has_many :subgroups, dependent: :destroy
  	has_many :clients, dependent: :destroy
end
