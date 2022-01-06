# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

description_examples = ['There is a place where as a developer you can be part of a highly innovative, career-marker career. As a software engineer, you will be working on cutting-edge projects and technology, building critical software solutions and designing games, mobile applications and applications.', 'Software Engineering is a fast-growing, exciting field. We offer career tracks for people who enjoy learning new technologies and solving challenging problems.', 'We develop the next generation of software engineers. This course will give you all the necessary skills to develop professional software solutions, mobile applications or even to design games.', "User Experience design is design that is user centered. The goal is to design artifacts that allow the users to meet their needs in the most effective efficient and satisfying manner. The course introduces the novice to a cycle of discovery and evaluation and a set of techniques that meet the user's needs.
This course is geared toward the novice. It is for learners that have heard about user experience or user interface design but don't really know much about these disciplines.
The course mantra is that “Design is a systematic and data driven process.” Design is systematic because it is based on a set of techniques and also on a cycle of discovery.
In this course the learner is introduced to the four step user interface design cycle. Along the way learners are exposed to a set of techniques to gather information about a) what the user needs b)how to design and model interfaces based on these and then how to evaluate the design to ascertain that the user's goals are met. These techniques are tools that are used in a standardized manner and give us the data we use in our design.", "The Deep Learning Specialization is a foundational program that will help you understand the capabilities, challenges, and consequences of deep learning and prepare you to participate in the development of leading-edge AI technology.
In this Specialization, you will build and train neural network architectures such as Convolutional Neural Networks, Recurrent Neural Networks, LSTMs, Transformers, and learn how to make them better with strategies such as Dropout, BatchNorm, Xavier/He initialization, and more. Get ready to master theoretical concepts and their industry applications using Python and TensorFlow and tackle real-world cases such as speech recognition, music synthesis, chatbots, machine translation, natural language processing, and more.
AI is transforming many industries. The Deep Learning Specialization provides a pathway for you to take the definitive step in the world of AI by helping you gain the knowledge and skills to level up your career. Along the way, you will also get career advice from deep learning experts from industry and academia.", "Course Description
Robotics is a lab-based course that uses a hands-on approach to introduce the basic concepts of
robotics, focusing on the construction and programming of autonomous mobile robots. Course
information will be tied to lab experiments; students will work in groups to build and test
increasingly more complex mobile robots, culminating in an end-of-semester robot contest.
We will be using VEX Robotic Design System as our platform. Students will be divided into groups
and complete a variety of robot construction and programming activities within the confines of
these groups.
Course Objectives
In this course, students will:
1. Explore the broad scope of robotic applications
2. Learn the basic components and building blocks of robots
3. Develop the robot construction skills
4. Learn to program the robots
5. Program autonomous mobile robots to achieve challenging tasks", "This program is for you if:


You’re a technical or non-technical professional seeking to expand your knowledge of the cybersecurity landscape

You’re a business leader or C-suite executive pursuing an understanding of the connection between business value and effective cybersecurity management

You’re a senior or middle manager with an interest in exploring the operational realities of implementing cybersecurity strategies within your organization

You’re looking to gain the frameworks and terminology to make effective decisions and develop a plan for cyber resilience

You’d like to motivate others to adopt or better implement long-term cybersecurity strategies within business

On completion of this program, you’ll walk away with:
1

An understanding of current data protection regulations, the new cyber risk environment, and the biggest threats to your industry or organization.

2

The ability to assess your organization’s cybersecurity strategy, with tactics to mitigate risk and privacy breaches.

3

A cybersecurity action plan to boost your organization’s value and secure its assets.

4

The skills to effectively manage a cybersecurity event, and a certificate of completion from one of the world’s leading business schools.1

1IMD (May, 2020)."]

20.times do |x|
  User.create!(email: Faker::Internet.email,
               nickname: "#{Faker::Movies::StarWars.character[0..15]}""#{x}",
               password: Faker::Lorem.characters(
                 number: 12,
                 min_alpha: 4,
                 min_numeric: 2
               ))
end

User.create!(email: 'theo@test.com',
             nickname: 'theo99',
             password: 'password',
             admin: true)
User.create!(email: 'rapha@test.com',
             nickname: 'rapha99',
             password: 'password',
             admin: true)
User.create!(email: 'audrey@test.com',
             nickname: 'audrey99',
             password: 'password',
             admin: true)
User.create!(email: 'bruno@test.com',
             nickname: 'bruno99',
             password: 'password',
             admin: true)

20.times do |y|
  Instructor.create!(email: Faker::Internet.email,
                     nickname: "#{Faker::Movies::StarWars.character[0..15]}""#{y}",
                     password: Faker::Lorem.characters(number: 12,
                                                       min_alpha: 4,
                                                       min_numeric: 2),
                     siret: Faker::Number.number(digits: 14),
                     website: 'https://www.thehackingproject.org',
                     description: Faker::Lorem.characters(number: rand(25..1000)))
end

Instructor.create!(email: 'theo@test.com',
                   nickname: 'theo99',
                   password: 'password',
                   siret: Faker::Number.number(digits: 14),
                   website: 'https://www.thehackingproject.org',
                   description: Faker::Lorem.characters(number: rand(25..1000)))
Instructor.create!(email: 'rapha@test.com',
                   nickname: 'rapha99',
                   password: 'password',
                   siret: Faker::Number.number(digits: 14),
                   website: 'https://www.thehackingproject.org',
                   description: Faker::Lorem.characters(number: rand(25..1000)))
Instructor.create!(email: 'audrey@test.com',
                   nickname: 'audrey99',
                   password: 'password',
                   siret: Faker::Number.number(digits: 14),
                   website: 'https://www.thehackingproject.org',
                   description: Faker::Lorem.characters(number: rand(25..1000)))
Instructor.create!(email: 'bruno@test.com',
                   nickname: 'bruno99',
                   password: 'password',
                   siret: Faker::Number.number(digits: 14),
                   website: 'https://www.thehackingproject.org',
                   description: Faker::Lorem.characters(number: rand(25..1000)))

20.times do
  random_boolean = [true, false].sample
  random_scale = %w[hour week month year].sample
  Course.create!(instructor_id: rand(Instructor.first.id..Instructor.last.id),
                 title: Faker::Marketing.buzzwords,
                 price: rand(0..9999),
                 diploma: random_boolean,
                 description: description_examples.sample,
                 remote: random_boolean,
                 address: Faker::Address.street_address,
                 zip_code: Faker::Address.zip_code,
                 start_date: Faker::Date.forward(days: rand(5..350)),
                 duration: rand(0..12),
                 duration_scale: random_scale)
  
end

30.times do
  Favorite.create!(user_id: rand(User.first.id..User.last.id),
                   course_id: rand(Course.first.id..Course.last.id))
end

250.times do
  Comment.create!(user_id: rand(User.first.id..User.last.id),
                  course_id: rand(Course.first.id..Course.last.id),
                  content: Faker::Quotes::Shakespeare.hamlet_quote)
end

250.times do
  Comment.create!(user_id: rand(User.first.id..User.last.id),
                  course_id: rand(Course.first.id..Course.last.id),
                  content: Faker::Quote.famous_last_words)
end

Tag.create(name: 'Fullstack')
Tag.create(name: 'Data Scientist')
Tag.create(name: 'UX Designer')
Tag.create(name: 'Developpeur')
Tag.create(name: 'Cyber Securite')
Tag.create(name: 'Ingénieur systeme')
Tag.create(name: 'Level Designer')
Tag.create(name: 'Artiste 3D')
Tag.create(name: 'Deep Learning')
Tag.create(name: 'Data Analyst')
Tag.create(name: 'Data Manager')
Tag.create(name: 'Machine Learning engineer')
Tag.create(name: 'Domotique')
Tag.create(name: 'Robotique')

30.times do
  Field.create!(tag_id: rand(Tag.first.id..Tag.last.id),
                course_id: rand(Course.first.id..Course.last.id))
end

400.times do
  rand_course = rand(Course.first.id..Course.last.id)
  rand_user = rand(User.first.id..User.last.id)
  find_course = Course.find(rand_course)
  find_user = User.find(rand_user)
  find_course.liked_by find_user
end

5.times do
  CoursesFeatured.create(course_id: rand(Course.first.id..Course.last.id))
end
