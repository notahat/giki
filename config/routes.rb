ActionController::Routing::Routes.draw do |map|
  map.resources :projects do |project|
    project.resources :pages, :new => { :new => :any }
  end
  map.root :projects
end
