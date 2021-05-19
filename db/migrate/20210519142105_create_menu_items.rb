class CreateMenuItems < ActiveRecord::Migration[6.1]
  class LocalMenuArea < ActiveRecord::Base
    self.table_name = 'menu_areas'
  end
  class LocalMenu < ActiveRecord::Base
    self.table_name = 'menus'
  end
  class LocalMenuItem < ActiveRecord::Base
    self.table_name = 'menu_items'
  end

  def change
    create_table :menu_items do |t|
      t.belongs_to :menu, nil: false
      t.integer :index, nil: false
      t.string :caption, nil: true
      t.string :url, nil: true
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        home = LocalMenuArea.find_by(description: 'Personal')
        menu = LocalMenu.find_by(menu_area_id: home.id, title: 'My Code')
        LocalMenuItem.create(menu_id: menu.id, index: 1, caption: 'Diary',           url: 'diary')
        LocalMenuItem.create(menu_id: menu.id, index: 2, caption: 'Make a Decision', url: 'decision')
        LocalMenuItem.create(menu_id: menu.id, index: 3)
        LocalMenuItem.create(menu_id: menu.id, index: 4, caption: 'localhost:3000',  url: 'https://localhost:3000')
        LocalMenuItem.create(menu_id: menu.id, index: 5)
        LocalMenuItem.create(menu_id: menu.id, index: 6, caption: 'Github',          url: 'https://github.com/gdshailes/Greg')
        LocalMenuItem.create(menu_id: menu.id, index: 7, caption: 'My Semaphore',    url: 'https://semaphoreci.com/gdshailes/greghome')
        LocalMenuItem.create(menu_id: menu.id, index: 8, caption: 'Heroku',          url: 'https://dashboard.heroku.com/login')

        menu = LocalMenu.find_by(menu_area_id: home.id, title: 'Money')
        LocalMenuItem.create(menu_id: menu.id, index: 1, caption: 'Finances',                   url: 'finances/accounts')
        LocalMenuItem.create(menu_id: menu.id, index: 2, caption: 'Halifax',                    url: 'https://www.halifax-online.co.uk/personal/logon/login.jsp')
        LocalMenuItem.create(menu_id: menu.id, index: 3, caption: 'MBNA',                       url: 'https://online.mbna.co.uk/personal/logon/login.jsp')
        LocalMenuItem.create(menu_id: menu.id, index: 4)
        LocalMenuItem.create(menu_id: menu.id, index: 5, caption: 'Coherent Pension',           url: 'https://we-are-coherent-limited.autoenrolment.co.uk')
        LocalMenuItem.create(menu_id: menu.id, index: 6, caption: 'Xero - Payslips & Expenses', url: 'https://login.xero.com/?username=greg%40coherent.work')

        menu = LocalMenu.find_by(menu_area_id: home.id, title: 'Fitness')
        LocalMenuItem.create(menu_id: menu.id, index: 1, caption: 'Strava',         url: 'https://www.facebook.com/v2.12/dialog/oauth?access_type=offline&client_id=284597785309&redirect_uri=https%3A%2F%2Fwww.strava.com%2Fo_auth%2Ffacebook&response_type=code&scope=email&state=%7B%22context%22%3A%22facebook_web_signin_v2%22%2C%22state%22%3A%22eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdGF0ZV9wYXJhbSI6Ims3NHR0ZzE4b2lhMWxlNjhrZGd2bG1tcDNkanRmYjA0In0.d3qS4KgK3FzA-QIhNjB3pB1GKCeqjPBFi4E3nfYxMVg%22%7D')
        LocalMenuItem.create(menu_id: menu.id, index: 2, caption: 'Bryton Active',  url: 'https://active.brytonsport.com/home')
        LocalMenuItem.create(menu_id: menu.id, index: 3, caption: 'Garmin Connect', url: 'https://connect.garmin.com/modern/')

        menu = LocalMenu.find_by(menu_area_id: home.id, title: 'Misc')
        LocalMenuItem.create(menu_id: menu.id, index: 1, caption: 'BBC Weather', url: 'https://www.bbc.co.uk/weather/2649024')
        LocalMenuItem.create(menu_id: menu.id, index: 2, caption: 'Ebay',        url: 'http://www.ebay.co.uk')
        LocalMenuItem.create(menu_id: menu.id, index: 3, caption: 'Google Maps', url: 'http://maps.google.co.uk')
        LocalMenuItem.create(menu_id: menu.id, index: 4, caption: 'GMail',       url: 'https://mail.google.com/mail/u/0/#inbox')
        LocalMenuItem.create(menu_id: menu.id, index: 5, caption: 'Calendar',    url: 'http://www.google.com/calendar')


        work = LocalMenuArea.find_by(description: 'Work')
        menu = LocalMenu.find_by(menu_area_id: work.id, title: 'Coherent')
        LocalMenuItem.create(menu_id: menu.id, index: 1, caption: 'Stack Overflow', url: 'https://stackoverflow.com/c/coherent')
        LocalMenuItem.create(menu_id: menu.id, index: 2)
        LocalMenuItem.create(menu_id: menu.id, index: 3, caption: 'Coherent Call',  url: 'https://meet.google.com/jat-rtze-pcd?authuser=2')
        LocalMenuItem.create(menu_id: menu.id, index: 4)
        LocalMenuItem.create(menu_id: menu.id, index: 5, caption: 'Development',    url: 'https://operator.coherent.test/users/login')
        LocalMenuItem.create(menu_id: menu.id, index: 6, caption: 'Edge',           url: 'https://hq.edge.coherent.work')
        LocalMenuItem.create(menu_id: menu.id, index: 7, caption: 'Staging',        url: 'https://hq.stage.coherent.work')
        LocalMenuItem.create(menu_id: menu.id, index: 8, caption: 'Production',     url: 'https://hq.coherent.work')

        menu = LocalMenu.find_by(menu_area_id: work.id, title: 'Coding')
        LocalMenuItem.create(menu_id: menu.id, index: 1, caption: 'Trello',        url: 'https://trello.com/b/0on8mpTi/greg')
        LocalMenuItem.create(menu_id: menu.id, index: 2, caption: 'Github',        url: 'https://github.com/Coherentwork/Coherent')
        LocalMenuItem.create(menu_id: menu.id, index: 3, caption: 'Semaphore',     url: 'https://semaphoreci.com/we-are-coherent-limited/coherent')
        LocalMenuItem.create(menu_id: menu.id, index: 4, caption: 'Semaphore 2.0', url: 'https://coherent.semaphoreci.com')
        LocalMenuItem.create(menu_id: menu.id, index: 5, caption: 'Bugsnag',       url: 'https://app.bugsnag.com/we-are-coherent-ltd/coherent/errors')
        LocalMenuItem.create(menu_id: menu.id, index: 6)
        LocalMenuItem.create(menu_id: menu.id, index: 7, caption: 'Rackspace',     url: 'https://mycloud.rackspace.co.uk/?ref=UK')

        menu = LocalMenu.find_by(menu_area_id: work.id, title: 'Integrations')
        LocalMenuItem.create(menu_id: menu.id, index: 1, caption: 'Salto KS - Accept',     url: 'https://skaas-accept.my-clay.com/login')
        LocalMenuItem.create(menu_id: menu.id, index: 2, caption: 'Salto KS - Production', url: 'http://skaas.my-clay.com/login')
        LocalMenuItem.create(menu_id: menu.id, index: 3, caption: 'Zapier',                url: 'https://zapier.com/app/dashboard')
        LocalMenuItem.create(menu_id: menu.id, index: 4, caption: 'GoCardless - Sandbox',  url: 'https://manage-sandbox.gocardless.com/')
        LocalMenuItem.create(menu_id: menu.id, index: 5, caption: 'GoCardless - Live',     url: 'https://manage.gocardless.com/')
        LocalMenuItem.create(menu_id: menu.id, index: 6, caption: 'Stripe',                url: 'https://dashboard.stripe.com/login')

      end
    end

  end
end
