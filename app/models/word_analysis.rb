class WordAnalysis < ActiveRecord::Base

  def self.word_analysis(info, kind)
    datafile = Rails.root + "lib/data/#{kind}.txt"
    keywords = File.readlines(datafile).map(&:strip)
    value = 0

    info.main_post.gsub(/[^a-z '-+]/i, '').split(' ').each do |word| 
      if keywords.include?(word.downcase)
         value += 1 
      end
    end

    info[kind] = value
  end

  def self.convert_scale_by_deviation(info, user, kind)
    squared_sum = 0.0
    sum = 0.0
    count = 0.0
    info.save
    values = user.infos.pluck(kind)

    values.each do | integer |
        squared_sum += integer ** 2
        sum += integer
        count += 1
    end

    variance = squared_sum / count
    standard_deviation = Math.sqrt(variance)
    average = sum / count
    case
    when average == 0
      5
    when info[kind] <= (average - (3 * standard_deviation))
      0
    when info[kind] <= (average - (1.35 * standard_deviation))
      1
    when info[kind] <= (average - (0.85 * standard_deviation))
      2
    when info[kind] <= (average - (0.56 * standard_deviation))
      3
    when info[kind] <= (average - (0.3 * standard_deviation))
      4
    when info[kind] <= (average + (0.3 * standard_deviation))
      5
    when info[kind] >= (average + (3 * standard_deviation))
      10
    when info[kind] >= (average + (1.35 * standard_deviation))
      9
    when info[kind] >= (average + (0.85 * standard_deviation))
      8
    when info[kind] >= (average + (0.56 * standard_deviation))
      7  
    else
      6
    end

  end

end
