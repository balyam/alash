namespace :db do
  desc "TODO"
  task seed: :environment do
  	seed_file = File.join('db/seeds.rb')
    load(seed_file) if File.exist?(seed_file)
  end

end
