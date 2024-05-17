class DiaryQuestion < ApplicationRecord
    belongs_to :diary
    belongs_to :question
end
