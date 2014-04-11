class ProfessorsController < ApplicationController
    def new
        @professor = Professor.new
    end

    def create
        @professor = Professor.new(professor_params)
        if @professor.save
            redirect_to @professor
        else
            render 'new'
        end
    end

    def show
        if Professor.exists?(params[:id])
            @professor = Professor.find(params[:id])
        else
            redirect_to professors_path
        end
    end

    def index
        @professors = Professor.all
    end

    def edit
        if Professor.exists?(params[:id])
            @professor = Professor.find(params[:id])
        else
            redirect_to professors_path
        end
    end

    def update
        if not Professor.exists? params[:id]
            # TODO alert failure
            redirect_to professors_path
            return
        end
        @professor = Professor.find(params[:id])
        if @professor.update(professor_params)
            redirect_to @professor
        else
            render 'edit'
        end
    end

    private
        def professor_params
            params.require(:professor).permit(:name, :nusp, :password, :department, :email)
        end
end
