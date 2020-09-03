class SongRetingsController < ApplicationController

    def create
        @song_reting = current_user.song_retings.new(song_reting_params)
        @song_reting.song_id = params[:song_reting][:song_id]
        if @song_reting.save
            redirect_back(fallback_location: root_path)
        else
            render "musics/show"
        end
    end

    def update
        @song_reting = SongReting.find(params[:id])
        if @song_reting.update(song_reting_params)
            redirect_back(fallback_location: root_path)
        else
            render "musics/show"
        end
    end
    

    private

    def song_reting_params
        params.require(:song_reting).permit(:rate, :song_id)
      end

    
end
