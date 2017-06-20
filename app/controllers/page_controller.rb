class PageController < ApplicationController

  before_action :set_products

  def home
  end

  def about_us
  end

  def contact_us

    @name = params[:name]

    @email = params[:email]

    @phone = params[:phone]
    @question = params[:question]
    @prefered = params[:prefered]
    @preferEmail = @prefered == "email" ? true : false
    @preferPhone = @prefered == "phone" ? true : false
    @signup = params[:signup]
    @signupcheck = @signup == "signup" ? true : false
    @request = params[:request]
    @requestcheck = @request == "request" ? true : false
    @selectedProduct = params[:products]
    @submit = params['commit']

    flash.now[:alert] = ""

    if (@submit == "Send Question")
      if (@name == "")
        flash.now[:alert] += "Name is required! "
      end
      if (@email == "")
        flash.now[:alert] += "Email is required! "
      end

      if (flash.now[:alert] == "")
        UserMailer.contact_email(params).deliver_now
      end


    end


  end

  def products

  end

  def set_products
    @products = []

    Product.all.each do |product|
      @products << product.name
    end

  end

  def newsletter
  end

  def blog
  end

  def calendar

    @month = params["month"].to_i
    @year = params["year"].to_i

    if @month == 0
      @month = Time.now.month
    end

    if @year == 0
      @year = Time.now.year
    end

  end

  def articles
  end

  def login
  end

end
