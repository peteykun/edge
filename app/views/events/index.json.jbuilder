json.categories @all_categories do |category|
  json.extract! category, :name
  json.black_icon_url category.black_icon.url
  json.white_icon_url category.white_icon.url

  json.events category.events do |event|
    json.extract! event, :name, :short_description, :created_at, :updated_at
    json.description raw @markdown.render(event.description).to_s
    json.image_url event.image.url
    json.contacts [event.contact1, event.contact2] do |contact|
      json.extract! contact, :name, :phone if contact
      json.facebook contact.facebook_username if contact
    end
  end
end
