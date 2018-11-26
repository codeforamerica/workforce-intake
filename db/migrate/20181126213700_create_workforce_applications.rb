class CreateWorkforceApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :workforce_applications do |t|
      t.string :email
      t.string :phone_number
      t.integer :household_size
      t.integer :earned_income

      t.timestamps
    end
  end
end
