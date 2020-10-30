FactoryBot.define do
  factory(:restaurant) do
    name { Faker::Restaurant.name} 
    kind { Faker::Restaurant.type }
    description { Faker::Restaurant.description }
    review { Faker::Restaurant.review }
  end

  factory(:shop) do
    name { Faker::Company.name }
    industry { Faker::Company.industry }
    logo_url { Faker::Company.logo }
    slogan { Faker::Company.catch_phrase }
  end
end