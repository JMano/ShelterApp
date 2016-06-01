class StaticPagesController < ApplicationController
  layout "users"
  def index
  end

  def about
    @shelter = Shelter.first
  end

  def contacts
    @email = Email.new
    @shelter = Shelter.first
  end

  def donations
  end

  def volunteer
  end
end
