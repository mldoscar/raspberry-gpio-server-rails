class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initialize_tasks

  private

    def initialize_tasks
      @gpio = AppSettings::GPIO
      return if @gpio.nil?

      # Set GPIO mode
      @gpio.set_numbering :board
    end
end
