#encoding: utf-8
require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:video){ build(:video) }

  context :validations do
    [:name, :url].each do |attr|
      it "Cannot be blank" do
        video.send("#{attr}=", "")
        expect(video.valid?).to eq(false)
      end
    end

    context :url do
      it "Should NOT be VALID an extension 'txt'" do
        video.url = Faker::Internet.url(host: 'example.com', path: '/foobar.txt')
        expect(video.valid?).to eq(false)
      end

      it "Should be valid an extension 'm3u8'" do
        video.url = Faker::Internet.url(host: 'example.com', path: '/foobar.m3u8')
        expect(video.valid?).to eq(true)
      end

      it "Should NOT be valid without HTTP on the beginning" do
        video.url = "://media.publit.io/file/ToriiGates.m3u8"
        expect(video.valid?).to eq(false)
      end
    end
  end

  context :update_viewers do
    it "Should be updated" do
      video.viewers = 0
      video.save
      video.update_viewers
      expect(video.viewers).to eq(1)
    end
  end
end
