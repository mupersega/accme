class ProfilesController < ApplicationController
  before_action :prep_profile, only: [:show, :edit, :update]

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    begin
      @profile.save!
      redirect_to profile_show_path(@profile.id)
    rescue
      raise
      flash.now[:errors] = @profile.errors.messages.values.flatten
      render 'new'
    end
  end

  def edit
    render :edit
  end

  def update
    @profile.update(profile_params)
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :blurb, :phone)
  end

  def prep_profile
    @profile = Profile.find(params[:id])
  end

end
