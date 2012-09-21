# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

u = User.create(:name => 'Admin', :email => "become@become.com", :password => 'azerty', :password_confirmation => 'azerty')

=begin

#---- Stable seeds

["No priority rating",
 "Important",
 "Very important",
 "Key for success",
 "Critical to achieve strategic objectives",
 "Critical to survival"
 ].each do |rating|
  PriorityRating.create(:rating => rating)
end

BcnTemplate.create(:name => "Vision", :description => "Learn about the activities of the Company, its main data, and have a global perspective of key business. Understand the relationships between different elements (business, functions, customers, suppliers ...) or know the Company's performance and the impact that may have some actions on the business. Anticipate future trends.")
BcnTemplate.create(:name => "Leadership, impact and influence", :description => "Ability to lead others, transmitting performance criteria that benefit the company. Demonstrates integrity, credibility, responsibility and exigency so as to constitute a benchmark within the company and be a role model. Ability to guide the team to establish what the expected results are, communicating with clarity and engaging in professional improvement of the team.")
BcnTemplate.create(:name => "Communication", :description => "Convey messages clearly and accurately, adapting to both the caller and the purpose of communication. It also involves ensuring proper reception and understanding of the message using active listening and empathizes with the speaker maintaining open communication flows.")
BcnTemplate.create(:name => "Business orientation", :description => "Guide the work towards achieving the objectives set and even overcome them, so that add value to the organization. Manages resources effectively to ensure the level of implementation and expected return on the investment.")
BcnTemplate.create(:name => "Planning, organization, implementation and control", :description => "Arrange ahead of own work and of others to achieve a specific purpose. Program actions to be undertaken in order to achieve the objective or objectives, setting priorities and effectively manage time and resources available. Evaluates and controls the pace of implementation, and makes the necessary means to ensure coverage of objectives according to plans marked.")
BcnTemplate.create(:name => "Decision", :description => "Act with determination and security both in everyday situations and unexpected crises. Establishes and coordinates the necessary actions (own and others) to solve problems in a responsive and effective way. Responds to decisions taken assuming calculated risk. Remains calm in difficult situations and conveys tranquility and security to others.")
BcnTemplate.create(:name => "Networking", :description => "Create, maintain and enhance ongoing relationships with people of different levels and areas (both internal and external to the Company), which add value to the professional performance and that are helpful for achieving business goals. It means recognizing what are the necessary contacts and represent the company in relation to these.")
BcnTemplate.create(:name => "Customer satisfaction", :description => "In-depth understanding of internal or external customer needs, and direct their efforts to meet the demands of these. Shows availability to the customer by creating a climate of trust and understanding. Involves offering products or services in accordance with the principles of Total Quality to benefit both the customer and the Company.")
BcnTemplate.create(:name => "Negociation", :description => "Come to an agreement allowing decisions mutually satisfactory, even in difficult situations or conflict. To show flexibility to adapt to the situation, communication, persuasion and also perseverance and self-control. Always seek the creation of enduring and positive results in the long term.")
BcnTemplate.create(:name => "Quality mangement", :description => "Know the procedures and contribute to the work and example to its implementation and improvement, implementing effectively and rigorously the knowledge learned in terms of concepts, systems and corporate procedures, of the firm or company, as well as new knowledge or experiences related to their professions.")
BcnTemplate.create(:name => "Flexibility and innovation", :description => "Acts autonomously assuming tasks or activities that improve or exceed expectations and adds value to the Company. Implies anticipating events and implementing measures which can prevent potential problems or take advantage of future opportunities.")
BcnTemplate.create(:name => "Initiative", :description => "Acts autonomously assuming tasks or activities that improve or exceed expectations and adds value to the Company. Implies anticipating events and implementing measures which can prevent potential problems or take advantage of future opportunities.")
BcnTemplate.create(:name => "Teamwork", :description => "Actively collaborate with other individuals and groups. Involves engaging with the team, adapting with flexibility to the role assigned, taking decisions as a team and maintaining the agreed commitments. Involves providing and sharing experience and information with all team members and openly express and seek opinions or views. Create and maintain the \"team spirit\", when a conflict arises in the team, not feed it and try to fix.")

#---- Test seeds

10.times.each do
  Company.create(:name => Faker::Company.name, :manager => Faker::Name.name, :description => Faker::Lorem.paragraph, :workers_count => 3+rand(100))
end

c = Company.find(1)

u = User.create(:name => 'Admin', :email => "b@b.com", :password => 'azerty', :password_confirmation => 'azerty')
u.companies << Company.find(1)
u.companies << Company.find(2)
u.companies << Company.find(3)
u.companies << Company.find(4)
u.save

10.times.each do
  Employee.create(:company => c, :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'azerty', :password_confirmation => 'azerty')
end

NB_BCN = 4
NB_BCN.times.each do
  c.bcns.create(:company => c, :name => Faker::Lorem.sentence, :description => Faker::Lorem.paragraphs(1+rand(3)).join).save
end

(NB_BCN*(2+rand(3))).times.each do
  Bcn.find(1+rand(NB_BCN)).learning_indicators.create(:name => Faker::Lorem.sentence).save
end

Level.find_each do |li|
  ill = rand(10)+1
  tl = rand(10)+1
  il = [ill, tl].min
  tl = [ill, tl].max
  cl = il+rand(tl-il+1)
  li.update_attributes(:initial_level => il, :current_level => cl, :target_level => tl, :priority_rating_id => 1)
end

=end