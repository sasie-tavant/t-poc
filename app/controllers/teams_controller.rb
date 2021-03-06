class TeamsController < ApplicationController

  before_filter :authenticate_user!

  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @teams = Team.search(params[:search], current_user).paginate(:page => params[:page], per_page: 10)
    else
      @teams = current_user.teams.paginate(:page => params[:page], per_page: 10)
    end
  end

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_team
      @team = current_user.teams.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :constructor, :podiums, :driver1, :driver2, :titles, :livery)
    end
end
