module Seeders
  module QuestionSeeder
    class << self
      def seed
        questions.each do |question_set|
          Question.find_or_create_by(main_postq: question_set[:main_postq]) do |q|
            q.main_postq = question_set[:main_postq]
            q.why_postq = question_set[:why_postq]
            puts "Question Set Created!"
          end
        end
      end

      def questions
        [
          {
            main_postq: 'How was your day?',
            why_postq: 'What was the most interesting thing that happened?'
          }
        ]
      end
    end
  end
end
