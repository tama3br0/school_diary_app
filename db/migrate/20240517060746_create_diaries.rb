class CreateDiaries < ActiveRecord::Migration[7.1]
    def change
        create_table :diaries do |t|
            t.integer :user_id, null: false
            t.date :date, null: false

            t.timestamps
        end
    end
end
