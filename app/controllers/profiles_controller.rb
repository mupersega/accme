class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    begin
      @profile.save!
      redirect_to @profile
    rescue
      flash.now[:errors] = @profile.errors.messages.values.flatten
      render 'new'
    end
  end

  def update
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end

end
