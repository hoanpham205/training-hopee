class ClientController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]
  def index
    @clients = Client.all
  end

  def show; end 

  def new 
    @client = Client.new 
    @client.build_address
  end

  def edit; end 

  def create 
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save 
        format.html {redirect_to client_url(@client), notice: 'Client was successfully created'}
        format.json {render :show, status: :created, location: @client}
      else
        format.html {render :new, status: :unprocessable_entity}
        format.json { render json: @client.errors, status: :unprocessable_entity}
      end
    end
  end

  def update 
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: 'Client was successfully updated'}
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to client_url, notice: 'Client was successfully detroyed' }
      format.json { head :no_content}
    end
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_path
      params.require(:client).permit(:first_name, :last_name, address_attributes: %i[id street city zipcode])
    end
end