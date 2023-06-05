class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      #ContactMailer.contact_mail(@contact, current_user).deliver
      redirect_to contacts_new_path, notice: 'お問い合わせ内容を送信しました'
    else
      flash.now[:alert] = '送信に失敗しました'
      render action: :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :content)
  end

end
