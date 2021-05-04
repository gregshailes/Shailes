class FixJoEmail < ActiveRecord::Migration[6.1]

  class LocalUser < ActiveRecord::Base
    self.table_name = 'users'
  end

  def up
    LocalUser.where(email: 'jo.shailes@hotmail.com').each do |user|
      user.update(email: 'jo.shailes@hotmail.co.uk')
    end
  end

end
