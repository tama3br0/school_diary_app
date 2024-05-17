require 'json'

# JSONファイルを読み込む
file_path = Rails.root.join('db', 'questions.json')
questions_data = JSON.parse(File.read(file_path))

questions_data.each do |question_data|
  # 質問が存在しない場合のみ作成
  question = Question.find_or_create_by!(text: question_data["text"])

  question_data["emotions"].each do |emotion_data|
    # 感情が存在しない場合のみ作成
    emotion = ChooseEmotion.find_or_create_by!(text: emotion_data["text"], level: emotion_data["level"])

    unless QuestionEmotion.exists?(question: question, choose_emotion: emotion)
      QuestionEmotion.create!(question: question, choose_emotion: emotion)
    end

    # Attach images to emotions based on text if not already attached
    unless emotion.image.attached?
      case emotion_data["text"]
      when "とても たのしかった", "とても よくわかった", "とても おいしかった"
        emotion.image.attach(io: File.open(Rails.root.join('app/assets/images/very_smile.png')), filename: 'very_smile.png')
      when "たのしかった", "よくわかった", "おいしかった"
        emotion.image.attach(io: File.open(Rails.root.join('app/assets/images/smile.png')), filename: 'smile.png')
      when "すこし たのしかった", "すこし わかった", "すこし おいしかった"
        emotion.image.attach(io: File.open(Rails.root.join('app/assets/images/normal.png')), filename: 'normal.png')
      when "たのしくなかった", "わからなかった", "おいしくなかった"
        emotion.image.attach(io: File.open(Rails.root.join('app/assets/images/shock.png')), filename: 'shock.png')
      end
    end
  end
end
