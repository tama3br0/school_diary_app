class Answer < ApplicationRecord
    belongs_to :diary
    belongs_to :question
    belongs_to :choose_emotion
end
