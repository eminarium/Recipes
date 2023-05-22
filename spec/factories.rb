FactoryBot.define do
  factory :unit do
    name { "MyString" }
  end

  factory :ingredient do
    name { "MyString" }
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end

  factory :list do
    title { Faker::Lorem.words.join(" ") }
    user { create(:user) }
  end

  factory :recipe do
    title { Faker::Lorem.words.join(" ") }
    brief_info { Faker::Lorem.sentence }
    user { create(:user) }
    image {
      Rack::Test::UploadedFile.new(
        Rails.root.join("app/assets/images/no-photo-icon-28.jpg")
      )
    }
  end

  factory :instruction do
    content { Faker::Lorem.sentence }
    recipe { create(:recipe) }
  end

end