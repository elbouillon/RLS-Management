FactoryGirl.define do
  factory :user do
    email 'j.doe@gmail.com'
    password '123456'
    firstname 'John'
    lastname 'Doe'
    mobile '079 322 56 66'
    phone '021 588 96 66'
    address 'Les lilas 33'
    city 'Lausanne'
    zip '1004'
    fsih_license_number 1234
  end
end
