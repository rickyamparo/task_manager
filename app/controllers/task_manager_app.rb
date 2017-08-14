require_relative '../models/task.rb'
require 'pry'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  attr_reader :location

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = Task.all
    @location = params[:location]
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    redirect '/tasks'
  end

  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :show
  end

  get '/easter' do
    erb :easter
  end

  get '/showmethetask' do
    redirect "/tasks"
  end

end
