class PagesController < ApplicationController
  def home
    @animals = Animal.all
  end

  def create
  end

end
