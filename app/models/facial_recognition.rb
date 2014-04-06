class FacialRecognition

  def self.api(info)
    unless info.image.blank?
      uri = URI::encode(info.image)
      @response = Unirest::get("https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?url=#{uri}&attribute=smiling",
      headers:{
        "X-Mashape-Authorization" => "ddgSpWEIQ6z8NMuVzNHb1gD7MjJjfkyA"
      })
      face = @response.body["face"]
      binding.pry
      info.smile = (face[0]["attribute"]["smiling"]["value"])/20
    end
  end

end
