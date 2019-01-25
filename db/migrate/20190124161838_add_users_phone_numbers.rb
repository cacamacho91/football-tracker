class AddUsersPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mobile_number, :string
  end
end
