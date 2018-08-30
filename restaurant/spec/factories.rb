FactoryBot.define do
  factory :user do
    name {"priya1"}
    email {"priya1@gmail.com"}
    password {"password"}
    mobile_no {"12339021988"}
  end

  factory :timing do
    day {"sun"}
    start_time {"2018-08-10 08:10"}
    end_time {"2018-08-10 08:10"}
    restaurant
  end

  factory :unavailabity do
    date {"2018-08-11"}
    start_time {"2018-08-11 08:10"}
    end_time {"2018-08-11 08:10"}
    full_day {"true"}
    restaurant
  end

  factory :restaurant do
    name {"priya"}
    address {"motavarachha"}
    mobile_no {"47874787346"}
    picture { Rack::Test::UploadedFile.new(Rails.root.join('spec/2.jpg'), 'image/jpg') }
  end

  factory :cuisine do
    name {"panjabi"}
    description {"dish of panjab"}
  end

  factory :facility do
    name {"partyhall"}
    description {"for book"}
  end

  factory :restaurants_cuisine do
    restaurant
    cuisine
  end

  factory :restaurants_facility do
    restaurant
    facility
  end
end
