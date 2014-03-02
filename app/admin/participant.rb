ActiveAdmin.register Participant do

  
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


  index do
    column :id
    column :name
    column :college
    column :email
    column :phone

    default_actions
  end

  show do |participant|
    attributes_table do
      row :id
      row :name
      row :college
      row :email
      row :phone
      row :events do
        result = ''

        participant.events.each do |event|
          result += link_to event.name, admin_event_path(event)
          result += '<br>'
        end

        raw result
      end
    end
  end
  
end
