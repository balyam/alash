class HomeController < ApplicationController
  # HACK: Request is inefficient
  def index
    @all_nodes ||= Person.all.size
  end
end
