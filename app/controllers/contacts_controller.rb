class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @is_user = User.find_by_email(params[:email])
    if @is_user.nil?
      @user = User.create(user_params)
      @user.password = "123456"
    end
    if params[:message].nil?
      @contact.message = "inscription newsletter"
    end
    if @contact.save
       # flash[:notice] = "Bienvenue dans la communauté Bahia !"
    else
       # flash[:alert] = "Votre inscription n'a pas marché !"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :first_name, :last_name, :message, :hidden, :seen)
  end

  def user_params
    params.require(:contact).permit(:email, :first_name, :last_name)
  end
end
