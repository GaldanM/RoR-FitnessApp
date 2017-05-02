Admin.create(login: 'admin', password: 'admin')

CustomPage.create(title: 'Halloween', text: 'If you subscribe to the Yoga class, you wil die by fear !')
CustomPage.create(title: 'Christmas', text: 'Merry Christmas !')

Message.create(name: 'Galdan MOULINNEUF', phone: '+33605425326', email: 'g.moulinneuf@outlook.fr', text: 'Hi, my name is Galdan', date: DateTime.now)
Message.create(name: 'Galdan MOULINNEUF', phone: '+33605425326', email: 'g.moulinneuf@outlook.fr', text: 'Hi, my name is Galdan', date: DateTime.now.midnight)

Membership.create(title: 'Bronze', description: 'Have access to every machines', price: 20)
Membership.create(title: 'Silver', description: 'Bronze avantages + free eneretic drinks and dietetic food', price: 50)
Membership.create(title: 'Gold', description: 'Silver avantages + personal trainer', price: 100)

Course.create(title: 'Yoga', day: 5, time: '15:00', description: 'Yoga class', instructor: 'Julius', start_date: DateTime.new(2017, 05, 01).midnight)