namespace :dev do
  desc "Configuring work environment"
  task setup: :environment do
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
  end
end