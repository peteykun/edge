ActiveAdmin.register Sponsor do

  
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

  permit_params :name, :year, :url, :logo
  config.sort_order = 'id_asc'
  
  index do
    column :name do |sponsor|
      link_to sponsor.name, sponsor.url
    end
    column :year
    column 'Logo' do |sponsor|
      image_tag(sponsor.logo.url(:small))
    end
    default_actions
  end

  form do |f|
    f.inputs 'Basic information' do
      f.input :name
      f.input :year
    end

    f.inputs 'Link and Logo' do
      f.input :url, label: 'Link URL'
      f.input :logo, as: :file
    end
    f.actions
  end

  
end
