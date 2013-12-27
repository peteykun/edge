ActiveAdmin.register Message do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  config.sort_order = "id_asc"
  
  index do
    column :id
    column :name
    column :email
    column :message
    column :contact_category_id
    default_actions
  end
  
end
