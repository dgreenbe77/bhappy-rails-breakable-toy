module Seeders
  module QuestionSeeder
    class << self
      def seed
        questions.each do |question|
          Question.find_or_create_by(healthq: question[:healthq]) do |q|
            q.wealthq = question[:wealthq]
            q.healthq = question[:healthq]
            q.cultureq = question[:cultureq]
            q.locationq = question[:locationq]
            q.spiritualityq = question[:spiritualityq]
            q.relationshipq = question[:relationshipq]
            q.activityq = question[:activityq]
            q.passionq = question[:passionq]
            q.satisfactionq = question[:satisfactionq]
            q.self_viewq = question[:self_viewq]
            puts "Question Set Created!"
          end
        end
      end

      def questions
        [
          {wealthq: 'How many luxury goods did you buy today?',
           healthq: 'How hard did you work out today?',
           cultureq: 'Did you visit a lot of museums this month?',
           locationq: 'How much do you like your residence?',
           spiritualityq: 'Have you prayed consistently this week?',
           relationshipq: 'Have you made any new friends recently?',
           activityq: 'Did you go out a lot last weekend?',
           passionq: 'Were you excited to get up this morning?',
           satisfactionq: 'Are you happy with your position at work?',
           self_viewq: 'Have you set a lot of goals for this year?'
          },
          {wealthq: 'Do you plan on spending a lot on your next car?',
           healthq: 'Have you been avoiding greasy food this week?',
           cultureq: 'Do you like to attend concerts?',
           locationq: 'Is there a lot to do around your neighborhood?',
           spiritualityq: 'Are you religious?',
           relationshipq: 'How is your dating life going?',
           activityq: 'Have you spending a lot of time away from home?',
           passionq: 'Do you get to do what you love often?',
           satisfactionq: 'Are you comfortable with where you are in life?',
           self_viewq: 'Do you believe that you are a good person?'
          }
        ]
      end
    end
  end
end
