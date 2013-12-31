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

  permit_params :name, :category_id, :short_description, :description, :contact1_id, :contact2_id, :image
  config.sort_order = "id_asc"

  controller do
    defaults finder: :find_by_slug
  end
  
  index do
    column :id
    column :name
    column :category
    column 'First contact', :contact1_id do |event|
      auto_link(event.contact1)
    end
    column 'Second contact', :contact2_id do |event|
      auto_link(event.contact2)
    end

    default_actions
  end

  show do |event|
    attributes_table do
      row :id
      row :name
      row :image do
        image_tag event.image.url(:flagship)
      end
      row :description do
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
        raw markdown.render(event.description)
      end
      row :category_id
      row :contact1_id
      row :contact2_id
    end
  end
  
  form do |f|
    f.inputs "Basic information" do
      f.input :name, label: 'Event name'
      f.input :category, label: 'Event category'
      f.input :short_description
    end

    f.inputs "Event description" do
      f.input :image, as: :file
      f.input :description, label: 'Detailed description'
    end

    f.inputs "Contacts" do
      f.input :contact1, label: 'First contact'
      f.input :contact2, label: 'Second contact'
    end

    f.actions
  end
  
end
