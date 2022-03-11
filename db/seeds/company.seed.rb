Location.new(name: "Main", address_1: "2 Lebuh Acheh", address_2: "Lebuh Acheh Georgetown", postcode: 10300, state: "Penang", country: "Malaysia").save

location = Location.first


Company.where(name: 'John Market').first_or_create! do |company|
    company.email = "john@owner.com"
    company.phone_number = "017-5179520"
    company.branch = "Georgetown"
    company.location_id = location.id
end