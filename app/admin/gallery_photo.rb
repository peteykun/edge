ActiveAdmin.register GalleryPhoto do

  
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

  permit_params :title, :description, :image
  config.sort_order = 'id_asc'

  index do
    column :id
    column :title
    column :description
    column 'Image' do |photo|
      image_tag(photo.image.url(:square_tile))
    end
    default_actions
  end

  form do |f|
    f.inputs 'Basic information' do
      f.input :title
      f.input :description
    end

    f.inputs 'The photo' do
      f.input :image, as: :file
    end

    f.actions
  end
  
end
