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

            def create
                campeon = Campeon.new(campeon_params)
                if campeon.save 
                    render json: {
                        status: 'EXITOSO',
                        message: 'Campeon creado',
                        data: campeon
                    },status: :ok
                else
                    render json: {
                        status: 'FALLIDO',
                        message: 'Campeon no creado',
                        data: campeon.errors
                    },status: :unprocessable_entity
                end
            end

            def destroy
                campeon = Campeon.find(params[:id])
                if campeon.destroy 
                    render json: {
                        status: 'EXITOSO',
                        message: 'Campeon eliminado',
                        data: campeon
                    },status: :ok
                else
                    render json: {
                        status: 'FALLIDO',
                        message: 'Campeon no eliminado',
                        data: campeon.errors
                    },status: :unprocessable_entity
                end
            end

            def update
                campeon = Campeon.find(params[:id])

                if campeon.update(campeon_params)
                   render json: {
                        status: 'EXITOSO',
                        message: 'Campeon actualizado',
                        data: campeon
                    },status: :ok
                else
                     render json: {
                        status: 'FALLIDO',
                        message: 'Campeon no actualizado',
                        data: campeon.errors
                    },status: :unprocessable_entity
                end
            end

            #Parametros que queremos que se utilicen para el create
            private
            #Deben ser los mismos parametros que definimos como required
            def campeon_params
                params.permit(:nombre,:region,:rol,:comp)
            end
        end
    end
end