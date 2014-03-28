class Info < ActiveRecord::Base
  belongs_to :user

  # def self.datafilter(field_name, user)
  #   data = Struct.new(:name, :field_name, :created_at)
  #   field_data = Array.new
  #   infos = user.infos
  #   infos.each do |info|
  #     field_data << data.new(field_name, info["#{field_name}"], info["created_at"].strftime('%y%m%d'))
  #   end
  #   field_data
  # end
  # <%= health = Info.datafilter("health", @user)%>
end
