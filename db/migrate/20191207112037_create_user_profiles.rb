class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :photo
      t.date :dob

      t.timestamps
    end
  end
end
