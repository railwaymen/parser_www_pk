class DataSourcesController < ApplicationController
  def index
    @data_sources = DataSource.all
    respond_to do |format|
      format.html
      format.xml  { render xml: @data_sources }
      format.json { render json: @data_sources }
    end
  end
end
