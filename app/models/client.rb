class Client < ActiveRecord::Base
	validates :name, :surname, :city, :phone, presence: true
	belongs_to :group
	has_many :notes, dependent: :destroy
end
