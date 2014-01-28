class RitlyController < ApplicationController

	def index
	end

	def create
		new_ritly = params.require(:ritly).permit(:link)
		if new_ritly["link"][0] != 'h'
			new_ritly["link"] = "http://" + new_ritly["link"]
		end
		ritly = Url.find_by(link: new_ritly["link"])
		if ritly == nil
			new_ritly['random_string'] = SecureRandom.urlsafe_base64(10)
			ritly = Url.create(new_ritly)
		end
		redirect_to show_path(ritly)
	end

	def show
		id = params[:id]
		@ritly = Url.find(id)
	end

	def go
		random_string = params[:random_string]
		ritly = Url.find_by(random_string: random_string)
		redirect_to ritly[:link]
	end

	def preview
		random_string = params[:random_string]
		@ritly = Url.find_by(random_string: random_string)
	end


end
