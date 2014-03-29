class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    if user_signed_in?
      @infos = @user.infos.order(created_at: :desc)
    else
      @infos = []
    end
  end

  def show
    @info = Info.find(params[:id])
    @user = current_user
    @infos = @user.infos
    uri = URI::encode(@info.url)
    @response = Unirest::get("https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?url=#{uri}&attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling",
    headers:{
      "X-Mashape-Authorization" => "ddgSpWEIQ6z8NMuVzNHb1gD7MjJjfkyA"
    })
    gon.infos = @infos.map(&:serializable_hash)
    gon.date = @infos.pluck(:created_at).map {|time| time.strftime('%Y, %m, %d')}
    gon.health = @infos.pluck(:health)
    # binding.pry
    # def self.datafilter(field_name)
    #   field_data = Array.new
    #   @infos.each do |info|
    #     field_data << {"#{field_name}" => info["#{field_name}"], "created_at" => info["created_at"]}
    #   end
    #   field_data
    # end
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def create
    @info = Info.new(info_params)
    unless @info.url.blank?
      uri = URI::encode(@info.url)
      @response = Unirest::get("https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?url=#{uri}&attribute=smiling",
      headers:{
        "X-Mashape-Authorization" => "ddgSpWEIQ6z8NMuVzNHb1gD7MjJjfkyA"
      })
      face = @response.body["face"]
      @info.smile = (face[0]["attribute"]["smiling"]["value"])/20
    end
    @user = current_user
    @user.infos << @info

    respond_to do |format|
      if @info.save
        format.html { redirect_to @info }
        format.json { render action: 'show', status: :created, location: @info }
      else
        format.html { render action: 'new' }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @info.update(info_params)
        format.html { redirect_to @info }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url }
      format.json { head :no_content }
    end
  end

  private
    def set_info
      @info = Info.find(params[:id])
    end

    def info_params
      params.require(:info).permit(:user_id, :happiness, :health, :wealth, :culture, :drama, :location, :spirituality, :relationship, :activity, :reflectivity, :civilization, :passion, :control, :satisfaction, :self_view, :url)
    end

end
