class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @user = current_user
    @infos = @user.infos
    unless @info.image.blank?
      uri = URI::encode(@info.image)
      @response = Unirest::get("https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?url=#{uri}&attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling",
      headers:{
        "X-Mashape-Authorization" => "ddgSpWEIQ6z8NMuVzNHb1gD7MjJjfkyA"
      })
    end
    gon.infos = @infos.map(&:serializable_hash)
    gon.date = @infos.pluck(:created_at)
  end

  def logs
    @user = current_user
    if user_signed_in?
      @infos = @user.infos.order(created_at: :desc)
    else
      @infos = []
    end
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def create
    @info = Info.new(info_params)
    FacialRecognition.api(@info)
    @user = current_user
    @user.infos << @info
    ['positive', 'negative', 'activity', 'culture', 'health', 'location', 'passion', 
     'relationship', 'satisfaction', 'self_view', 'spirituality', 'wealth'].each do |kind|
      WordAnalysis.word_analysis(@info, kind)
      @info["#{kind}_scale"] = WordAnalysis.convert_scale_by_deviation(@info, @user, kind)
    end
    @info.happy = @info.positive_scale - @info.negative_scale
    @info.happy_scale = WordAnalysis.convert_scale_by_deviation(@info, @user, 'happy')

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
      params.require(:info).permit(:main_post, :image, :user_id, :happiness, :health, :wealth, :culture, :drama, :location, :spirituality, :relationship, :activity, :reflectivity, :civilization, :passion, :control, :satisfaction, :self_view, :url)
    end

end
