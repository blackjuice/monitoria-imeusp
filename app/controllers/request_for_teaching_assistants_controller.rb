class RequestForTeachingAssistantsController < ApplicationController
  before_action :set_request_for_teaching_assistant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_professor!

  # GET /request_for_teaching_assistants
  # GET /request_for_teaching_assistants.json
  def index
    @request_for_teaching_assistants = (RequestForTeachingAssistant.all.map do
      |request| request
    end).keep_if do |request|
      request.professor_id == current_professor.id or 
          (current_professor.super_professor and current_professor.department == request.course.department)
    end
  end

  # GET /request_for_teaching_assistants/1
  # GET /request_for_teaching_assistants/1.json
  def show
  end

  # GET /request_for_teaching_assistants/new
  def new
    @request_for_teaching_assistant = RequestForTeachingAssistant.new
  end

  # GET /request_for_teaching_assistants/1/edit
  def edit
    if (not @request_for_teaching_assistant) or
        (@request_for_teaching_assistant.professor_id != current_professor.id)
      redirect_to request_for_teaching_assistants_path
    end
  end

  # POST /request_for_teaching_assistants
  # POST /request_for_teaching_assistants.json
  def create
    params[:request_for_teaching_assistant][:professor_id] = current_professor.id
    @request_for_teaching_assistant = RequestForTeachingAssistant.new(request_for_teaching_assistant_params)
    
    respond_to do |format|
      if @request_for_teaching_assistant.save
        format.html { redirect_to @request_for_teaching_assistant, notice: 'Pedido de Monitoria feito com sucesso.' }
        format.json { render action: 'show', status: :created, location: @request_for_teaching_assistant }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_for_teaching_assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_for_teaching_assistants/1
  # PATCH/PUT /request_for_teaching_assistants/1.json
  def update
    respond_to do |format|
      if @request_for_teaching_assistant.update(request_for_teaching_assistant_params)
        format.html { redirect_to @request_for_teaching_assistant, notice: 'Pedido de Monitoria atualizado com sucesso.' }
        format.json { render action: 'show', status: :ok, location: @request_for_teaching_assistant }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_for_teaching_assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_for_teaching_assistants/1
  # DELETE /request_for_teaching_assistants/1.json
  def destroy
    if (not @request_for_teaching_assistant) or
        (@request_for_teaching_assistant.professor_id != current_professor.id)
      redirect_to request_for_teaching_assistants_path
    else
      @request_for_teaching_assistant.destroy
      respond_to do |format|
        format.html { redirect_to request_for_teaching_assistants_url }
        format.json { head :no_content }
      end
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_for_teaching_assistant
      if RequestForTeachingAssistant.exists?(params[:id])
        @request_for_teaching_assistant = RequestForTeachingAssistant.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_for_teaching_assistant_params
      params.require(:request_for_teaching_assistant).permit(:professor_id, :subject, :requested_number, :priority, :student_assistance, :work_correction, :test_oversight, :course_id, :observation)
    end

end
