ActiveAdmin.register Contact do

  
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

  permit_params :name, :facebook_username, :phone
  config.sort_order = "id_asc"
  
  index do
    column :id
    column :name
    column :facebook_username
    column :phone
    default_actions
  end

  form do |f|
    f.inputs "Basic information" do
      f.input :name
    end

    f.inputs "Contact information" do
      f.input :facebook_username
      f.input :phone
    end

    f.actions
  end
  
end
