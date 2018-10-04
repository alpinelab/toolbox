namespace :db do

  desc 'Create fake seeds for dev'
  task dev_seeds: :environment do
    puts "----------------"
    puts "Wait and seeds !"
    puts "----------------"
    puts ""

    puts "cleaning DB : destroy #{Dependency.count} dependencies"
    puts "cleaning DB : destroy #{Comment.count} comments "
    Dependency.destroy_all
    Comment.destroy_all

    puts "create 2 dependencies: Faker and Rubocop"
    d1 = Dependency.create(name: "Faker")
    d2 = Dependency.create(name: "Rubocop")

    puts "create 1 unpublished comment, related to dependency Faker"
    Comment.create(body: "I won't publish my point of view about Faker, but ...", published: false, dependency: d1)

    puts "create 2 published comments, related to dependency Rubocop"
    Comment.create(body: "In love with Rubocop: Good Style!", published: true, dependency: d2)
    Comment.create(body: "80 characters is too much => let's code twenty_per_line", published: true, dependency: d2)

    puts "#{Dependency.count} created"
    puts "#{Comment.count} created"

    puts "----------------"
    puts "Happy Growing !"
    puts "----------------"
  end
end
