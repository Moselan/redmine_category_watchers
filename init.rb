require 'redmine'

Redmine::Plugin.register :redmine_category_watchers do
  name 'Redmine Seguidores Categoria Plugin'
  author ''
  description 'Este plugin añade automáticamente los Seguidores de una Categoría a las Peticiones'
  version '0.0.1'
  

  permission :category_watchers, { :category_watchers => [:index, :add] }, :public => true
  
  permission :access_category_watchers, :category_watchers => :index
  permission :add_category_watchers,	:category_watchers => :add
  


   menu :project_menu, :category_watchers, { :controller => 'category_watchers', :action => 'index' }, 
  			:caption => :category_watchers, :after => :wiki,
  			:if => Proc.new {
    					User.current.allowed_to?(:access_category_watchers, nil, {global:true})
   			}

end

require File.dirname(__FILE__) + '/lib/redmine_category_watchers/hooks'