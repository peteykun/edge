ActiveAdmin.register Category do

  
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

  permit_params :name
  config.sort_order = "id_asc"
  
  index do
    column :id
    column :name
    default_actions
  end

  form do |f|
    f.inputs "Basic information" do
      f.input :name, label: 'Category Name'
    end
    f.actions
  end

end
