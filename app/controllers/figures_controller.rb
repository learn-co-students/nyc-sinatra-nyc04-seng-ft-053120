class FiguresController < ApplicationController
  # add controller methods
  get '/' do
    redirect "/figures"
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    landmark_name = params[:landmark][:name]
    title_name = params[:title][:name]

    if !landmark_name.empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !title_name.empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    landmark_name = params[:landmark][:name]
    title_name = params[:title][:name]

    if !landmark_name.empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !title_name.empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end
end
