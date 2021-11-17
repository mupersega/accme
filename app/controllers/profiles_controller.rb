class ProfilesController < ApplicationController
  before_action :prep_profile, only: [:show, :edit, :update]
  before_action :prep_qualifications, only: [:edit, :new]

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
    raise
    begin
      @profile.save!
      redirect_to profile_show_path(@profile.id)
    rescue
      flash.now[:errors] = @profile.errors.messages.values.flatten
      render 'new'
    end
  end

  def edit
    render :edit
  end

  def update
    @profile.update(profile_params)
    ProfileQualification.destroy_by(profile_id: @profile.id)
    params[:qualification_ids].each do | qual_id, maj_id|
      ProfileQualification.create(profile_id:@profile.id, qualification_id:qual_id, major_id:maj_id)
    end
    redirect_to root_path
    # begin
    #   @profile.update(profile_params)
    #   ProfileQualification.destroy_by(profile_id: @profile.id)
    #   profile_params.qualification_ids.each do | qual_id, maj_id|
    #     ProfileQualification.create(profile_id:@profile.id, qualification_id:qual_id, major_id:maj_id)
    #   end
    #   redirect_to root_path
    # rescue
    #   flash.now[:errors] = @profile.errors.messages.values.flatten
    #   render 'edit'
    # end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :blurb, :phone, :picture, :qualification_ids)
  end

  def prep_profile
    @profile = Profile.find(params[:id])
  end

  def prep_qualifications
    @qualifications = Qualification.all
    @majors = Major.all
  end

end
