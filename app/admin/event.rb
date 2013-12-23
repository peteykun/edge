ActiveAdmin.register Event do

  
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

  permit_params :name, :category, :description, :contact1, :contact2
  config.sort_order = "id_asc"
  
  index do
    column :id
    column :description
    column :image_url, label: 'Image'
    column :contact1_id
    column :contact2_id

    default_actions
  end
  
  form do |f|
    f.inputs "Basic information" do
      f.input :name, label: 'Event Name'
      f.input :category, label: 'Event Category'
    end

    f.inputs "Event description" do
      f.input :description, label: 'Detailed Description'
    end

    f.inputs "Contacts" do
      f.input :contact1, label: 'First contact'
      f.input :contact2, label: 'Second contact'
    end

    f.actions
  end
  
end
