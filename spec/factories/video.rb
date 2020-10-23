FactoryBot.define do
  factory :video do
  	name { Faker::Name.name }
    url { Faker::Internet.url(host: 'example.com', path: '/foobar.m3u8') }
  end
end
