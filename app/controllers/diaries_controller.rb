class DiariesController < ApplicationController
    before_action :authenticate_user!

    def new
      @diary = Diary.new
      @questions = Question.all
    end

    def create
      # 同じ日の日記がある場合は削除
      current_user.diaries.where(date: diary_params[:date]).destroy_all

      @diary = current_user.diaries.build(diary_params)
      if @diary.save
        params[:answers].each do |question_id, choose_emotion_id|
          @diary.answers.create(
            question_id: question_id,
            choose_emotion_id: choose_emotion_id
          )
        end

        # スタンプを追加
        Stamp.create(user: current_user, diary: @diary)

        redirect_to stamp_path(current_user.id), notice: 'にっきを とうろくしました！'
      else
        @questions = Question.all
        render :new
      end
    end

    def choose_diary
      date = params[:date]&.to_date || Date.today
      @diaries = current_user.diaries.order(date: :desc).group_by { |d| d.date.beginning_of_week(:monday) }
    end

    def show
      @diary = current_user.diaries.find(params[:id])
      @questions = @diary.answers.includes(:question, :choose_emotion).map(&:question).uniq
    end

    private

    def diary_params
      params.require(:diary).permit(:date)
    end
end
