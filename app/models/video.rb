class Video < ApplicationRecord
	validates :name, :url, presence: true
	validates :url, presence: true, format: { with: /\Ahttp(s|):\/{2}(.{1,}\D){1,}\.m3u8\Z/i, allow_blank: false }

	belongs_to :user
end
