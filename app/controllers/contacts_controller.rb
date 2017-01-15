class ContactsController < ApplicationController
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
    if @contact.save
       flash[:notice] = "Votre message a bien été envoyé ! On vous répond rapidement"
       redirect_to contact_path
    else
       flash[:alert] = "Nous avons eu un petit beug, vous pouvez nous envoyer un message à hola@bahiablanca.co"
       render :new
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
