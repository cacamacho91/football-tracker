class SettingUpUsersLeaguesCountriesAndUserleaguesTables < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :name
      t.string :password
    end

    create_table :leagues do |t|
      t.string :name
      t.integer :country_id
    end

    create_table :countries do |t|
      t.string :name
    end

    create_table :userleagues do |t|
      t.integer :user_id
      t.integer :league_id
    end
  end
end
