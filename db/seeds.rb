Dependency.destroy_all
Comment.destroy_all

puts "create 2 dependencies: d1 and d2"
d1 = Dependency.create(name: "Gem n°1")
d2 = Dependency.create(name: "Gem n°2")

puts "create 1 unpublished comment, c0,related to dependency d1"
c0 = Comment.create(body: "unpublished comment", published: false, dependency: d1)

puts "create 2 published comments; c1 and c2, related to dependency d2"
c1 = Comment.create(body: "published comment number 1", published: true, dependency: d2)
c2 = Comment.create(body: "published comment number 2", published: true, dependency: d2)

puts "#{Dependency.count} created"
puts "#{Comment.count} created"

puts "Happy Growing !"