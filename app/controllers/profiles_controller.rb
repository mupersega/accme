class ProfilesController < ApplicationController
  before_action :prep_profile, only: [:show, :edit, :update, :destroy]
  before_action :prep_qualifications, only: [:edit, :new]
  before_action :authenticate_user!, except: :index
  before_action :check_auth

  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    params[:profile_qualifications].each do | key, value|
      if value == "1"
        @profile.profile_qualifications.new(qualification_id:key, major_id:params[key][:qualification_major])
      end
    end
    @profile.save!
    redirect_to root_path
  end

  def edit
    render :edit
  end

  def update
    @profile.update(profile_params)
    ProfileQualification.destroy_by(profile_id:@profile.id)
    params[:profile_qualifications].each do | key, value|
      if value == "1"
        @profile.profile_qualifications.new(qualification_id:key, major_id:params[key][:qualification_major])
      end
    end
    @profile.save
    # raise
    redirect_to profile_path(@profile.id)
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end  

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :blurb, :phone, :picture, :qualification_ids, :contactable)
  end

  def prep_profile
    @profile = Profile.find(params[:id])
  end

  def prep_qualifications
    @qualifications = Qualification.all
    @majors = Major.all
  end

  def check_auth
    authorize @profile || Profile
  end

end
