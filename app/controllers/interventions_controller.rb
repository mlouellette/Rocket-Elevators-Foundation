class InterventionsController < ApplicationController
  require 'rubygems'
  require 'rest-client'
  require 'json'

  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
    @customer = Customer.all
    @employee = Employee.all
    
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end

          # Your freshdesk domain
      freshdesk_domain = 'rocketelevatorscanada'

      # It could be either your user name or api_key.
      user_name_or_api_key = ENV['FRESHDESK_API_KEY']

      # If you have given api_key, then it should be x. If you have given user name, it should be password
      password_or_x = 'x'

      #attachments should be of the form array of Hash with files mapped to the key 'resource'.
      multipart_payload = JSON.generate({ status: 2,

                    priority: 1,
                    type: "Question",
                    email: leads.contactEmail,
                    description: "The contact #{leads.contactName} from company #{leads.contactBuisnessName} can be reached at email #{leads.contactEmail} and at phone number #{leads.contactPhone}. #{leads.contactDepartement} has a project named #{leads.projectName} which would require contribution from Rocket Elevators.
                    <br><br>
                    #{leads.message} 
                    <br><br>
                    Attached Message: #{leads.contactAttachment}",
                    subject: "#{leads.contactName} from #{leads.contactBuisnessName} #{Time.now} "

      })

      freshdesk_api_path = 'api/v2/tickets'

      freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

      site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)

      begin
        response = site.post(multipart_payload, :content_type => 'application/json')
        puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
        rescue RestClient::Exception => exception
        puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
        puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
        puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
      end

      # --------------------- FRESH DESK ----------------------
 
      leads = Lead.new

      leads.contactName = params[:CustomerID]
      leads.contactEmail = params[:BuildingID]
      leads.contactPhone = params[:BatteryID]
      leads.contactBuisnessName = params[:ColumnID]
      leads.contactDepartement = params[:ElevatorID]
      leads.projectName = params[:EmployeeID]
      leads.reportMessage = params[:Report]

      current_time = DateTime.now

      leads.contactDate = current_time.strftime "%d/%m/%Y"

      
      flash[:success] = "Request successfully sent!"

      # Your freshdesk domain
      freshdesk_domain = 'rocketelevatorscanada'

      # It could be either your user name or api_key.
      user_name_or_api_key = 'Ai0bKsUV8epuyjb9h7'

      # If you have given api_key, then it should be x. If you have given user name, it should be password
      password_or_x = 'x'

      #attachments should be of the form array of Hash with files mapped to the key 'resource'.
      multipart_payload = JSON.generate({ status: 2,

                    priority: 1,
                    type: "incident",
                    email: leads.contactEmail,
                    description: "The contact #{leads.contactName} from company #{leads.contactBuisnessName} can be reached at email #{leads.contactEmail} and at phone number #{leads.contactPhone}. #{leads.contactDepartement} has a project named #{leads.projectName} which would require contribution from Rocket Elevators.
                    <br><br>
                    #{leads.message} 
                    <br><br>
                    Attached Message: #{leads.contactAttachment}",
                    subject: "#{leads.contactName} from #{leads.contactBuisnessName} #{Time.now} "

      })

      freshdesk_api_path = 'api/v2/tickets'

      freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

      site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)

      begin
        response = site.post(multipart_payload, :content_type => 'application/json')
        puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
        rescue RestClient::Exception => exception
        puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
        puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
        puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
      end


  end

  def customerData
    # this contains what has been selected in the first select box
    @customers = params[:CompanyName]

    # we get the data for selectbox 2
    @data_for_select2 = MyModel.where(:some_id => @data_from_select1).all

    # render an array in JSON containing arrays like:
    # [[:id1, :name1], [:id2, :name2]]
    render :json => @data_for_select2.map{|c| [c.id, c.name]}
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.fetch(:intervention, {})
    end
end
