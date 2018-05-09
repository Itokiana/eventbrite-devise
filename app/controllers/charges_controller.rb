class ChargesController < ApplicationController
    before_action :authenticate_user!

    def new
    end
    
    def create
      # Amount in cents

      @amount = Event.find(params[:event]).price
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'eur'
      )
      redirect_to suscribe_path(params[:event])
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
    # p params[:event]

end
