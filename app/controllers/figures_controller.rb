class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do

    figure = Figure.new(name: params[:figure][:name])

    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      if params[:figure][:title_ids]
        params[:figure][:title_ids] << title.id
      else
        params[:figure][:title_ids] = title.id
      end
    end
    figure.title_ids = params[:figure][:title_ids]

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name])
      if params[:figure][:landmark_ids]
        params[:figure][:landmark_ids] << landmark.id
      else
        params[:figure][:landmark_ids] = landmark.id
      end
    end
    figure.landmark_ids = params[:figure][:landmark_ids]

    figure.save

    redirect "/figures/#{figure.id}"
  end

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  post '/figures/:id' do

    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name]

    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      if params[:figure][:title_ids]
        params[:figure][:title_ids] << title.id
      else
        params[:figure][:title_ids] = title.id
      end
    end
    figure.title_ids = params[:figure][:title_ids]

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name])
      if params[:figure][:landmark_ids]
        params[:figure][:landmark_ids] << landmark.id
      else
        params[:figure][:landmark_ids] = landmark.id
      end
    end
    figure.landmark_ids = params[:figure][:landmark_ids]

    figure.save

    redirect "/figures/#{figure.id}"
  end


end
