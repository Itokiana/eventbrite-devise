# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Event.delete_all
EventAttendee.delete_all

u1 = User.new(id:1, name: 'koto', email: 'koto@gmail.com')
u2 = User.new(id:2, name: 'rabe', email: 'rasoa@gmail.com')
u3 = User.new(id:3, name: 'soa', email: 'soa@gmail.com')

e = Event.create(description: "coucou", date: "20/02/18", place: "p4h")
a = EventAttendee.new
a.event = e

p "Sans user"
p e
p a.event

e.creator = u1
a.attendee = u2
a.save
a = EventAttendee.new
a.event = e
a.attendee = u3
a.save

p "Avec user"
p "Event"
p e
p 'Creator event'
p u1
p 'User attend event'
a

u1.save
u2.save
u3.save
e.save
