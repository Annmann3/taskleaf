class Task < ApplicationRecord
	validate :validate_name_not_including_comma
	before_validation :set_nameless_name

	validates :name, presence: true, length: { maximum: 30 }

	private
	def set_nameless_name
		self.name = '名無しさん' if name.blank?
	end
	
	def validate_name_not_including_comma
		errors.add(:name, 'にカンマを含めることができません') if name&.include?(',')
	end
end