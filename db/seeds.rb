# frozen_string_literal: true

SocialNetwork.create!(name: 'facebook')
SocialNetwork.create!(name: 'twitter')
SocialNetwork.create!(name: 'google')

25.times do
  fl = FederalLegislator.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  p = Person.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  Poster.create!(person_id: p.id)
  Poster.create!(federal_legislator_id: fl.id)
end

[
  'State Governors',
  'Department of Defense',
  'Department of Offense',
  'My list',
  'Some guys'
].each do |name|
  pg = PersonGroup.new(name: name)
  pos_count = rand(4..10)

  pos_count.times do
    pg.posters << Poster.find(rand(1..40))
  end
  pg.save

  10.times do
    Article.create!(
      poster: pg.posters[rand(pos_count)],
      social_network: SocialNetwork.find(rand(1..2)),
      title: Faker::Company.name,
      body: Faker::Lorem.paragraph(2, false, 4),
      link: Faker::Internet.url('facebook.com'),
      publish_date: Faker::Date.between(1.year.ago, 1.year.from_now)
    )
  end
end

4.times do
  Client.create!(name: Faker::GameOfThrones.character)
end

c = Client.find(1)
c.person_groups = PersonGroup.limit(1)
c.save!

c = Client.find(2)
c.person_groups = PersonGroup.limit(2)
c.save!

c = Client.find(3)
c.person_groups = PersonGroup.order(id: :desc).limit(1)
c.save!

%w[Moldova USA].each { |name| Country.create!(name: name) }
%w[English Russian French].each { |name| Language.create!(name: name) }
