class FiguresController < ApplicationController
  
  get '/figures/new' do
    # lets you view a form to create a new figure
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  post '/figures' do
    # create a new figure based on form info

    # example of what params looks like upon form submission...

    # {"figure"=>{"name"=>"Anh The Great", "title_ids"=>["19"], "landmark_ids"=>["55"]},
    # "title"=>{"name"=>"The Boss"},
    # "landmark"=>{"name"=>"Coney Island Boardwalk", "year_completed"=>"2000"}}

    # creates a new figure with the params[:figure]; AR will take title_ids arr and landmark_ids arr and assign these titles and landmarks to the figure
    @figure = Figure.create(params[:figure])

    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get "/figures" do
    # lets you view a page with all the figures' names
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/:id" do
    # find the figure by params[:id], then renders /figures/show, which is a show page for that figure

    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    @titles = @figure.titles

    erb :'/figures/show'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  patch "/figures/:id" do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end
