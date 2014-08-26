Streamlog::Engine.routes.draw do
  get '/' => 'logs#index'
  get '/stream' => 'logs#stream'
end
