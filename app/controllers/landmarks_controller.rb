class LandmarksController < ApplicationController

  get "/landmarks/new" do
    # allows you to view form to create a new landmark
    erb :'landmarks/new'
  end

  post "/landmarks" do
    # create a new landmark based on info given
    @landmark = Landmark.create(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do 
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/show'
  end

  get "/landmarks" do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch "/landmarks/:id" do
    # update the landmark with new info
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect to "/landmarks/#{@landmark.id}"
  end

end
