class WelcomeController < ApplicationController
  def index
      respond_to do |format|
          format.html { render :text => "Hello World!" }
      end
  end
end
