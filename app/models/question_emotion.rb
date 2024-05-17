class QuestionEmotion < ApplicationRecord
    belongs_to :question
    belongs_to :choose_emotion
end
