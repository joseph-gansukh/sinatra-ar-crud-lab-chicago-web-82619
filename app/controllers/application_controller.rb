
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  get '/articles/new' do 
    erb :'new'
  end

  post '/articles' do 
    @article = Article.new params
    @article.save

    redirect "/articles/#{@article.id}"
  end

  get "/articles" do 
    # binding.pry
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])

    erb :show
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

  

end
