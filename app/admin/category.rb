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

  permit_params :name, :black_icon, :white_icon
  config.sort_order = 'id_asc'
  
  index do
    column :id
    column :name
    column 'Black Icon' do |event|
      image_tag(event.black_icon.url(:small))
    end
    column 'White Icon' do |event|
      image_tag(event.white_icon.url(:small))
    end
    default_actions
  end

  form do |f|
    f.inputs 'Basic information' do
      f.input :name, label: 'Category Name'
    end

    f.inputs 'Icons' do
      f.input :black_icon, as: :file
      f.input :white_icon, as: :file
    end
    f.actions
  end

end
