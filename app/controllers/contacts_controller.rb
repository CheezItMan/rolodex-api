class ContactsController < ApplicationController

  def index
    contacts = Contact.all
    render :json => contacts, :status => :ok
  end

  def show
    contact = Contact.find_by(id: params[:id].to_i)
    if contact
      render :json => contact, :status => :ok
    else
      render :json => [], :status => :ok
    end
  end

  def update
    id = params[:id]

    contact = Contact.find_by(id: id)

    if contact
      if params[:name]
        contact.name = params[:name]
      end
      if params[:tel]
        contact.tel  = params[:tel]
      end
      if params[:avatar]
        contact.avatar = params[:avatar]
      end
      if params[:email]
        contact.email = params[:email]
      end
      if contact.save
        render :json => {ok: true}, :status => :ok
      else
        render :json => {ok: false}, :status => :internal_server_error
      end
    else
      render :json => {ok: false}, :status => :not_found
    end

  end

  def create
    contact = Contact.new(name: params[:name], tel: params[:tel], avatar: params[:avatar], email: params[:email])
    if contact.save
      render :json => contact, status: :ok
    else
      render :json => contact, status: :internal_server_error
    end

  end

  def destroy
    id = params[:id]
    contact = Contact.find_by(id: id)

    if contact
      if contact.destroy
        render :json => {ok: true}, status: :ok
      else
        render :json => {ok: false}, status: :internal_server_error
      end
    else
      render :json => {ok: false}, status: :not_found
    end
  end

  private
    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, DELETE'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

end
