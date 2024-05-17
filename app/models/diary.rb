class Diary < ApplicationRecord
    belongs_to :user
    has_many :diary_questions
    has_many :questions, through: :diary_questions
    has_many :answers, dependent: :destroy
    has_many :stamps, dependent: :destroy

    validates :date, presence: true

    def previous_day
        user.diaries.where('date < ?', date).order(date: :desc).first
    end

    def next_day
        user.diaries.where('date > ?', date).order(date: :asc).first
    end
end
