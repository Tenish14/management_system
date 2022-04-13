Company.where(name: 'John Market Sdn Bhd').first_or_create! do |company|
    company.email = "john@georgetown.com"
    company.phone_number = "017-5179520"
    company.branch = "Georgetown"
end