class CreateQuestionEmotions < ActiveRecord::Migration[7.1]
    def change
        create_table :question_emotions do |t|
            t.references :question, null: false, foreign_key: true
            t.references :choose_emotion, null: false, foreign_key: true

            t.timestamps
        end
    end
end
