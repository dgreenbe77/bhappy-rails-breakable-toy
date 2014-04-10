require 'spec_helper'

describe 'WordAnalysis' do
  
  describe 'word data analysis' do

    it 'should return correct word count based on word bank' do
      info = FactoryGirl.build(:info)
      WordAnalysis.word_analysis(info, 'positive')
      expect(info.positive).to eq(2.0)
      expect(info.negative).to eq(0.0)
      info = Info.new(main_post: "negative hate bad")
      WordAnalysis.word_analysis(info, 'negative')
      expect(info.positive).to eq(0.0)
      expect(info.negative).to eq(3.0)
    end

    it 'should create a scale based on the word count, standard deviation, and normal distribution' do
      user = FactoryGirl.create(:user)
      info = FactoryGirl.create(:info, user: user)
      WordAnalysis.word_analysis(info, 'positive')
      expect(WordAnalysis.convert_scale_by_deviation(info, user, 'positive')).to eq(5.0)
      info2 = FactoryGirl.create(:info, main_post: 'hi a+ happy hi a+ happy hi a+ happy hi a+ happy hi a+ happy hi a+ happy hi a+ happy hi a+ happy!')
      WordAnalysis.word_analysis(info2, 'positive')
      expect(WordAnalysis.convert_scale_by_deviation(info2, user, 'positive')).to eq(10.0)
    end

  end

end
