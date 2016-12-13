class PhotographsController < ApplicationController
	 def create
        @photograph = Photograph.new(photograph_params)
        if @photograph.save
            render json: { message: "success", photographId: @photograph.id }, status: 200
        else
            render json: { error: @photograph.errors.full_messages.join(", ") }, status: 400
        end
    end

    def destroy
        @photograph = Photograph.find(params[:id])
        if @photograph.destroy
            render json: { message: "file deleted from server" }
        else
            render json: { message: @photograph.errors.full_messages.join(", ") }
        end
    end

    def list
        listing = Listing.find(params[:listing_id])

        photographs = []
        Photograph.where(listing_id: listing.id).each do |photograph|
            new_photograph = {
                id: photograph.id,
                name: photograph.image_file_name,
                size: photograph.image_file_size,
                src: photograph.image(:thumb)
            }
            photographs.push(new_photograph)
        end
        render json: { images: photographs }
    end

    private
    def photograph_params
        params.require(:photograph).permit(:image,:listing_id)
    end
end