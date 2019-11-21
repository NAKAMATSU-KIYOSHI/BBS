class Bb < ApplicationRecord
	has_one_attached :image
	before_validation :set_nameless_name
	validates :name, presence: true, length: { maximum: 30 }
	validate :validates_name_not_including_comma

	private

	def set_nameless_name
		self.name = '名前なし' if name.blank?
	end

	def validates_name_not_including_comma
		errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
	end
	belongs_to :user

	scope :recent, -> {order(created_at: :desc)}
end
