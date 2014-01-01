class SponsorsController < ApplicationController
  def index
    years = Sponsor.all.order('id ASC').pluck(:year).sort.reverse
    @sponsors = Hash.new

    years.each do |year|
      @sponsors[year] = Sponsor.where(year: year)
    end
  end
end
