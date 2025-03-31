namespace :dev do
  desc 'Sets up the development environment'
  task setup: :environment do
    if Rails.env.production?
      puts 'This task can only be run in development or test environments!'
      exit
    end

    puts '== Setting up development environment =='

    puts '\n== Dropping database =='
    system('bin/rails db:drop')

    puts '\n== Creating database =='
    system('bin/rails db:create')

    puts '\n== Running migrations =='
    system('bin/rails db:migrate')

    puts '\n== Loading seed data =='
    system('bin/rails db:seed')

    puts '\n== Clearing logs and temporary files =='
    system('bin/rails log:clear tmp:clear')

    puts '\n== Restarting application server =='
    system('bin/rails restart')

    puts '\n== Dev setup completed! =='
    puts 'Run "bin/rails s" to start the server'
    puts 'Admin login: admin@example.com, password: password'
  end

  desc 'Reset the database and load seed data'
  task reset: :environment do
    if Rails.env.production?
      puts 'This task can only be run in development or test environments!'
      exit
    end

    puts '== Resetting the database =='
    system('bin/rails db:drop db:create db:migrate db:seed')
    puts 'Database has been reset and seed data loaded!'
  end

  desc 'Create sample data for development'
  task sample_data: :environment do
    if Rails.env.production?
      puts 'This task can only be run in development or test environments!'
      exit
    end

    require 'faker'

    puts '== Creating sample data =='

    # Create additional users
    10.times do
      User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password',
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      )
    end

    # Create additional posts
    User.all.each do |user|
      rand(3..8).times do
        user.posts.create!(
          title: Faker::Lorem.sentence(word_count: rand(3..8)).gsub('.', ''),
          content: Faker::Lorem.paragraphs(number: rand(3..8)).join('\n\n'),
          published: [true, true, false].sample,
          created_at: rand(1..30).days.ago
        )
      end
    end

    puts "Created #{User.count} users and #{Post.count} posts in total"
  end
end
