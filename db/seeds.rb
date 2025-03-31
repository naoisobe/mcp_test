# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create admin user
admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Admin',
  last_name: 'User',
  admin: true
)

# Create regular users
5.times do |i|
  User.create!(
    name: "User #{i+1}",
    email: "user#{i+1}@example.com",
    password: 'password',
    password_confirmation: 'password',
    first_name: "First#{i+1}",
    last_name: "Last#{i+1}"
  )
end

# Sample post content
sample_contents = [
  "Ruby on Rails is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages.\n\nIt encourages and facilitates the use of web standards such as JSON or XML for data transfer and HTML, CSS and JavaScript for display and user interfacing. In addition to MVC, Rails emphasizes the use of other well-known software engineering patterns and paradigms, including convention over configuration (CoC), don't repeat yourself (DRY), and the active record pattern.",
  
  "React is a free and open-source front-end JavaScript library for building user interfaces based on components. It is maintained by Meta and a community of individual developers and companies.\n\nReact can be used to develop single-page, mobile, or server-rendered applications with frameworks like Next.js. Because React is only concerned with the user interface and rendering components to the DOM, React applications often rely on libraries for routing and other client-side functionality.",
  
  "PostgreSQL, also known as Postgres, is a free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance.\n\nPostgreSQL features transactions with Atomicity, Consistency, Isolation, Durability (ACID) properties, automatically updatable views, materialized views, triggers, foreign keys, and stored procedures. It is designed to handle a range of workloads, from single machines to data warehouses or Web services with many concurrent users.",
  
  "Test-driven development (TDD) is a software development process relying on software requirements being converted to test cases before software is fully developed, and tracking all software development by repeatedly testing the software against all test cases.\n\nThis is as opposed to software being developed first and test cases created later. American software engineer Kent Beck, who is credited with having developed or 'rediscovered' the technique, stated in 2003 that TDD encourages simple designs and inspires confidence.",
  
  "Responsive web design (RWD) is an approach to web design that aims to make web pages render well on a variety of devices and window or screen sizes from minimum to maximum display size.\n\nRecent work also considers the viewer proximity as part of the viewing context as an extension for RWD. Content, design and performance are necessary across all devices to ensure usability and satisfaction."
]

# Create sample posts
User.all.each do |user|
  2.times do |i|
    user.posts.create!(
      title: "Sample Post #{i+1} by #{user.name}",
      content: sample_contents.sample,
      published: [true, true, false].sample # 2/3 chance of being published
    )
  end
end

puts "Seed data created successfully!"
puts "Admin login: admin@example.com, password: password"
puts "Created #{User.count} users and #{Post.count} posts"
