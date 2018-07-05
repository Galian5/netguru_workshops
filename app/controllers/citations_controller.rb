class CitationsController < ApplicationController
  def new
    @citation = Citation.new
  end

  def create
    @citation = Citation.new(cit_params)

    if @citation.save
      redirect_to citations_index_path
      flash[:success] = 'Citation added successfully'
    else
      render 'new'
    end
  end

  def index
    @citations = Citation.all
  end

  private

  def cit_params
    params.require(:citation).permit(:text)
  end
end
