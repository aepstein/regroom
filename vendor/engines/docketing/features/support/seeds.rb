# Load required seed data before each scenario
Before do
  Dir[File.expand_path("#{::Rails.root}/db/seeds/*.rb")].each do |seed|
    require seed
  end
end

