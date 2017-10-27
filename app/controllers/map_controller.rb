class MapController < ApplicationController
  def index
    @counties = {}
    County.all.each do |county|
      @counties[county.name] = county.activity
    end
  end
end
