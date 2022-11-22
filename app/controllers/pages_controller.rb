class PagesController < ApplicationController
  def home
    @products = Products.all
  end
end
