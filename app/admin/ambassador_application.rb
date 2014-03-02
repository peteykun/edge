ActiveAdmin.register AmbassadorApplication do

  
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

  permit_params :participation_id, :essay
  
  index do
    column :id
    column :essay
    column 'Applicant', :participant_id do |ambassador_application|
      auto_link(ambassador_application.participant)
    end
    column 'Collge', :participant_id do |ambassador_application|
      ambassador_application.participant.college
    end

    default_actions
  end
  
end
