ActiveAdmin.register Post do
  scope :all, :default => true
  Post::STATUS.each do |status|
    scope status.to_sym do |posts|
      posts.where("status = ?", status)
    end
  end

  form do |f|
    f.inputs "New Post" do
        f.input :title
        f.input :status, :as => :select, :collection => Post::STATUS
        f.input :category
        f.input :body
        f.buttons
    end
  end
  
  index do
    column :title
    default_actions
  end

  show do |post|
    attributes_table do
      row :title
      row :category
      row :status do |post| 
        status_tag post.status, (post.status == "Published" ? :ok : :warning)
      end
      row :body
    end
    active_admin_comments
  end

  sidebar "Other Post for this Category", :only => :show do
    ul do
      Post.where("id IS NOT ? AND category_id = ?", resource.id, resource.category.id).each do |post| 
        li link_to post.title, admin_post_path(post)
      end
    end
  end
end
