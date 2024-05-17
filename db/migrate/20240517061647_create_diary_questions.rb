class CreateDiaryQuestions < ActiveRecord::Migration[7.1]
    def change
        create_table :diary_questions do |t|
            t.references :diary, null: false, foreign_key: true
            t.references :question, null: false, foreign_key: true

            t.timestamps
        end
    end
end
