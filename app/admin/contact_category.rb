ActiveAdmin.register ContactCategory do

  
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

  permit_params :name, :contact1_id, :contact2_id
  config.sort_order = "id_asc"
  
  index do
    column :id
    column :name
    column 'First contact', :contact1_id do |event|
      auto_link(event.contact1)
    end
    column 'Second contact', :contact2_id do |event|
      auto_link(event.contact2)
    end

    default_actions
  end
  
  form do |f|
    f.inputs "Basic information" do
      f.input :name, label: 'Event name'
    end

    f.inputs "Contacts" do
      f.input :contact1, label: 'First contact'
      f.input :contact2, label: 'Second contact'
    end

    f.actions
  end
  
end
