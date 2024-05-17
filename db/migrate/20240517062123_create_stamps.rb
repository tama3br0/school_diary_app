class CreateStamps < ActiveRecord::Migration[7.1]
    def change
        create_table :stamps do |t|
            t.references :user, null: false, foreign_key: true
            t.references :diary, null: false, foreign_key: true

            t.timestamps
        end
    end
end
