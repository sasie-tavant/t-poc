class WelcomeController < ApplicationController

  layout 'application'

  def index
    @teams = Team.search(params[:search] || '').paginate(:page => params[:page], per_page: 10)
  end

  def show
    @team = Team.find_by_id(params[:id])

    unless @team
      flash[:notice] = 'No record found.'
      redirect_to root_path
    end
  end

end
