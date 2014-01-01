class SponsorsController < ApplicationController
  def index
    years = Sponsor.all.pluck(:year).sort.reverse
    @sponsors = Hash.new

    years.each do |year|
      @sponsors[year] = Sponsor.where(year: year).order('id ASC')
    end
  end
end
