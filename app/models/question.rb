class Question < ApplicationRecord
    has_many :question_emotions, dependent: :destroy
    has_many :choose_emotions, through: :question_emotions
end
