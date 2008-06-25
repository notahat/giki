ActionController::Routing::Routes.draw do |map|
  map.resources :projects, :member => { :pull => :get, :push => :get } do |project|
    project.resources :pages, :new => { :new => :any }
  end
  map.root :projects
end
