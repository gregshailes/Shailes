# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  first_name: 'Greg',
  last_name: 'Shailes',
  email: 'greg.shailes@gmail.com',
  password: 'changeme',
  password_confirmation: 'changeme'
)


home = MenuArea.create(description: 'Personal')        

menu = Menu.create(menu_area_id: home.id, title: 'My Code', index: 1)
MenuItem.create(menu_id: menu.id, index: 1, caption: 'Diary',           url: 'diary')
MenuItem.create(menu_id: menu.id, index: 2, caption: 'Make a Decision', url: 'decision')
MenuItem.create(menu_id: menu.id, index: 3)
MenuItem.create(menu_id: menu.id, index: 4, caption: 'localhost:3000',  url: 'https://localhost:3000')
MenuItem.create(menu_id: menu.id, index: 5)
MenuItem.create(menu_id: menu.id, index: 6, caption: 'Github',          url: 'https://github.com/gdshailes/Greg')
MenuItem.create(menu_id: menu.id, index: 7, caption: 'My Semaphore',    url: 'https://semaphoreci.com/gdshailes/greghome')
MenuItem.create(menu_id: menu.id, index: 8, caption: 'Heroku',          url: 'https://dashboard.heroku.com/login')

menu = Menu.create(menu_area_id: home.id, title: 'Money', index: 2)
MenuItem.create(menu_id: menu.id, index: 1, caption: 'Finances',                   url: 'finances/accounts')
MenuItem.create(menu_id: menu.id, index: 2, caption: 'Halifax',                    url: 'https://www.halifax-online.co.uk/personal/logon/login.jsp')
MenuItem.create(menu_id: menu.id, index: 3, caption: 'MBNA',                       url: 'https://online.mbna.co.uk/personal/logon/login.jsp')
MenuItem.create(menu_id: menu.id, index: 4)
MenuItem.create(menu_id: menu.id, index: 5, caption: 'Coherent Pension',           url: 'https://we-are-coherent-limited.autoenrolment.co.uk')
MenuItem.create(menu_id: menu.id, index: 6, caption: 'Xero - Payslips & Expenses', url: 'https://login.xero.com/?username=greg%40coherent.work')

menu = Menu.create(menu_area_id: home.id, title: 'Fitness', index: 3)
MenuItem.create(menu_id: menu.id, index: 1, caption: 'Strava',         url: 'https://www.facebook.com/v2.12/dialog/oauth?access_type=offline&client_id=284597785309&redirect_uri=https%3A%2F%2Fwww.strava.com%2Fo_auth%2Ffacebook&response_type=code&scope=email&state=%7B%22context%22%3A%22facebook_web_signin_v2%22%2C%22state%22%3A%22eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdGF0ZV9wYXJhbSI6Ims3NHR0ZzE4b2lhMWxlNjhrZGd2bG1tcDNkanRmYjA0In0.d3qS4KgK3FzA-QIhNjB3pB1GKCeqjPBFi4E3nfYxMVg%22%7D')
MenuItem.create(menu_id: menu.id, index: 2, caption: 'Bryton Active',  url: 'https://active.brytonsport.com/home')
MenuItem.create(menu_id: menu.id, index: 3, caption: 'Garmin Connect', url: 'https://connect.garmin.com/modern/')

menu = Menu.create(menu_area_id: home.id, title: 'Misc', index: 4)
MenuItem.create(menu_id: menu.id, index: 1, caption: 'BBC Weather', url: 'https://www.bbc.co.uk/weather/2649024')
MenuItem.create(menu_id: menu.id, index: 2, caption: 'Ebay',        url: 'http://www.ebay.co.uk')
MenuItem.create(menu_id: menu.id, index: 3, caption: 'Google Maps', url: 'http://maps.google.co.uk')
MenuItem.create(menu_id: menu.id, index: 4, caption: 'GMail',       url: 'https://mail.google.com/mail/u/0/#inbox')
MenuItem.create(menu_id: menu.id, index: 5, caption: 'Calendar',    url: 'http://www.google.com/calendar')

work = MenuArea.create(description: 'Work')        
menu = Menu.create(menu_area_id: work.id, title: 'Coherent', index: 2)
MenuItem.create(menu_id: menu.id, index: 1, caption: 'Stack Overflow', url: 'https://stackoverflow.com/c/coherent')
MenuItem.create(menu_id: menu.id, index: 2)
MenuItem.create(menu_id: menu.id, index: 3, caption: 'Coherent Call',  url: 'https://meet.google.com/jat-rtze-pcd?authuser=2')
MenuItem.create(menu_id: menu.id, index: 4)
MenuItem.create(menu_id: menu.id, index: 5, caption: 'Development',    url: 'https://operator.coherent.test/users/login')
MenuItem.create(menu_id: menu.id, index: 6, caption: 'Edge',           url: 'https://hq.edge.coherent.work')
MenuItem.create(menu_id: menu.id, index: 7, caption: 'Staging',        url: 'https://hq.stage.coherent.work')
MenuItem.create(menu_id: menu.id, index: 8, caption: 'Production',     url: 'https://hq.coherent.work')

menu = Menu.create(menu_area_id: work.id, title: 'Coding', index: 3)
MenuItem.create(menu_id: menu.id, index: 1, caption: 'Trello',        url: 'https://trello.com/b/0on8mpTi/greg')
MenuItem.create(menu_id: menu.id, index: 2, caption: 'Github',        url: 'https://github.com/Coherentwork/Coherent')
MenuItem.create(menu_id: menu.id, index: 3, caption: 'Semaphore',     url: 'https://semaphoreci.com/we-are-coherent-limited/coherent')
MenuItem.create(menu_id: menu.id, index: 4, caption: 'Semaphore 2.0', url: 'https://coherent.semaphoreci.com')
MenuItem.create(menu_id: menu.id, index: 5, caption: 'Bugsnag',       url: 'https://app.bugsnag.com/we-are-coherent-ltd/coherent/errors')
MenuItem.create(menu_id: menu.id, index: 6)
MenuItem.create(menu_id: menu.id, index: 7, caption: 'Rackspace',     url: 'https://mycloud.rackspace.co.uk/?ref=UK')

menu = Menu.create(menu_area_id: work.id, title: 'Integrations', index: 4)
MenuItem.create(menu_id: menu.id, index: 1, caption: 'Salto KS - Accept',     url: 'https://skaas-accept.my-clay.com/login')
MenuItem.create(menu_id: menu.id, index: 2, caption: 'Salto KS - Production', url: 'http://skaas.my-clay.com/login')
MenuItem.create(menu_id: menu.id, index: 3, caption: 'Zapier',                url: 'https://zapier.com/app/dashboard')
MenuItem.create(menu_id: menu.id, index: 4, caption: 'GoCardless - Sandbox',  url: 'https://manage-sandbox.gocardless.com/')
MenuItem.create(menu_id: menu.id, index: 5, caption: 'GoCardless - Live',     url: 'https://manage.gocardless.com/')
MenuItem.create(menu_id: menu.id, index: 6, caption: 'Stripe',                url: 'https://dashboard.stripe.com/login')
