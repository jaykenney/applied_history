class ContactsController < ApplicationController

  def index
    render locals: { contacts: position.contacts.by_name, position: position }
  end

  def new
    render locals: { contact: position.contacts.build }
  end

  def create
    contact = position.contacts.build(contact_params)

    if contact.save
      redirect_to position
    else
      render locals: { contact: contact }, action: :new
    end
  end

  def edit
    render locals: { contact: find_contact }
  end

  def update
    contact = find_contact

    if contact.update_attributes(contact_params)
      redirect_to position
    else
      render locals: { contact: contact }, action: :edit
    end
  end

  def destroy
    find_contact.destroy

    redirect_to position
  end

  private

  def contact_params
    params.require(:contact).permit(
      :email,
      :name,
      :phone
    )
  end

  def find_contact
    position.contacts.find params.require(:id)
  end

  def position
    @position ||= Position.find params.require(:position_id)
  end
end
