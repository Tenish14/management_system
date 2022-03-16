Company.where(name: 'John Market').first_or_create! do |company|
    company.email = "john@georgetown.com"
    company.phone_number = "017-5179520"
    company.branch = "Georgetown"
end

company = Company.find(1)

Location.new(name: "Georgetown", address_1: "2 Lebuh Acheh", address_2: "Lebuh Acheh Georgetown", postcode: 10300, state: "Penang", country: "Malaysia", company_id: company.id).save
Location.new(name: "Butterworth", address_1: "420 Lorong Bagan 1", address_2: "Taman Bagan Jaya", postcode: 14200, state: "Johor", country: "Malaysia", company_id: company.id).save
