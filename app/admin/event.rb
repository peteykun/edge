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

  permit_params :name, :new, :category_id, :short_description, :description, :contact1_id, :contact2_id, :contact3_id, :sponsor_id, :image
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
    column 'Third contact', :contact3_id do |event|
      auto_link(event.contact3)
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
      row :contact3_id
      row :sponsor
    end
  end
  
  form do |f|
    f.inputs "Basic information" do
      f.input :name, label: 'Event name'
      f.input :category, label: 'Event category'
      f.input :new, label: 'This is a new event'
      f.input :short_description
    end

    f.inputs "Event description" do
      f.input :image, as: :file
      f.input :description, label: 'Detailed description'
    end

    f.inputs "Contacts" do
      f.input :contact1, label: 'First contact'
      f.input :contact2, label: 'Second contact'
      f.input :contact3, label: 'Third contact'
    end

    f.inputs "Sponsor" do
      max_year = Sponsor.maximum(:year)
      where_clause = "year = " + max_year.to_s

      if params[:id]
        @event = Event.friendly.find(params[:id])
        where_clause += " or id = " + @event.sponsor.id.to_s if @event.sponsor
      end
      
      f.input :sponsor, collection: Hash[Sponsor.where(where_clause).map{|s| [s.year == max_year ? s.name : s.name + ' (' + s.year.to_s + ')', s.id]}]
    end

    f.actions
  end
  
end
