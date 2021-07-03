module Api
    module V1
        #el nombre del controlador debe ser en plural y la clase se debe llamar igual que el controlador
        # GET /campeones
        class CampeonesController < ApplicationController
            def index
                campeones = Campeon.order('created_at')
                # render json:{
                #     status: 'EXITOSO',
                #     message: 'Campeones Cargados',
                #     data: campeones
                # }, status: :ok
                render json: campeones, status: :ok
            end

            #metodo para obtener campeon que querramos usando el id
            def show
                campeon = Campeon.find(params[:id])
                render json: campeon, status: :ok
            end
        end
    end
end