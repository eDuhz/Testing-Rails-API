namespace :dev do
  desc "Configuring work environment"
  task setup: :environment do
    %x(rails db:create db:migrate)
    puts "Reseting DB"
    puts "Registering combobox types"

    kinds= %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(description: kind)
    end

    puts "Creating fake information to fill the combobox"
    10.times do |i|
      Combobox.create!(
        cnpj: Faker::Number.number,
        contract: Faker::Company.swedish_organisation_number,
        campaign: Faker::Address.street_name,
        kind: Kind.all.sample
        )
    end
    p "Fake information created"

    puts "Registering telephone numbers"

    Combobox.all.each do |combobox|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        combobox.phones << phone
        combobox.save!
      end
    end
    puts "Telephone numbers registered"

    puts "Registering Addresses"
    Combobox.all.each do |combobox|
      address = Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        combobox: combobox
      )
    end
    puts "Adresses registered"
  end
end