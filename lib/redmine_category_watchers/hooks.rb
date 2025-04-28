module RedmineCategoryWatchers
  class Hooks < Redmine::Hook::ViewListener
    
    # Para nuevas incidencias
    def controller_issues_new_after_save(context)
      issue = context[:issue]
      auto_watch(issue)
    end

    # Para edición de incidencias
    def controller_issues_edit_before_save(context)
      issue = context[:issue]
      
      # Verificar si la categoría está siendo cambiada
      if issue.category_id_changed? && !issue.category_id_was.nil?
        # Eliminar watchers de la categoría anterior
        remove_watchers_from_old_category(issue)
      end
      
      # Agregar watchers de la nueva categoría (si ha cambiado o no)
      auto_watch(issue) unless issue.category_id.nil?
    end
    
    private
    
    def auto_watch(issue)
      cw = CategoryWatcher.where(category_id: issue.category_id).first
      return if cw.nil?
      
      watchers = cw.watchers.split(',')
      watchers.each do |id|
        user = User.find(id.to_i)
        issue.add_watcher(user) unless issue.watcher_user_ids.include?(user.id)
      end
    end
    
    def remove_watchers_from_old_category(issue)
      old_category_id = issue.category_id_was
      cw = CategoryWatcher.where(category_id: old_category_id).first
      return if cw.nil?
      
      watchers_to_remove = cw.watchers.split(',')
      watchers_to_remove.each do |id|
        user = User.find(id.to_i)
        issue.remove_watcher(user) if issue.watcher_user_ids.include?(user.id)
      end
    end
  end
end
