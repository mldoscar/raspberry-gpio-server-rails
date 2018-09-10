class HomeController < ApplicationController
  before_action :gpio_validation, except: [:index]

  def index

  end

  def set_input_pin
    @pin = "#{params[:pin]}".to_i
    @state = "#{params[:state]}".to_sym

    @gpio.setup @pin, :as => :output, :initialize => :low

    case @state
    when :low
      @gpio.set_low @pin
    when :high
      @gpio.set_high @pin
    when :clean_up
      @gpio.clean_up @pin
    else
      redirect_to root_url, status: :unprocessable_entity
      return
    end

    render :index
  end

  def hard_reset
    @gpio.reset
    redirect_to root_url
  end

  private

    def gpio_validation
      redirect_to root_url, status: :unprocessable_entity if @gpio.nil?
    end
end
