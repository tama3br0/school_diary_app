class CreateChooseEmotions < ActiveRecord::Migration[7.1]
    def change
        create_table :choose_emotions do |t|
            t.string :text, null: false
            t.integer :level, null: false

            t.timestamps
        end
    end
end
