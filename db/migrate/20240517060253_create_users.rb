class CreateUsers < ActiveRecord::Migration[7.1]
    def change
        create_table :users do |t|
            t.string :email, null: false
            t.string :uid, null: false
            t.string :provider
            t.string :name
            t.integer :role, null: false, default: 0
            t.references :grade_class, null: false, foreign_key: true
            t.integer :student_num

            t.timestamps
        end

        add_index :users, :email, unique: true
        add_index :users, :uid, unique: true
    end
end
