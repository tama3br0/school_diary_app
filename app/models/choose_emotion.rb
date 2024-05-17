class ChooseEmotion < ApplicationRecord
    has_many :question_emotions, dependent: :destroy
    has_many :questions, through: :question_emotions
    has_one_attached :image
end
