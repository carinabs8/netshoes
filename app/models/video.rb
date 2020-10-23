class Video < ApplicationRecord
	validates :name, :url, presence: true
	validates :url, presence: true, format: { with: /\.m3u8\Z/i, allow_blank: false }
end
