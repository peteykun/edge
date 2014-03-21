json.contact_categories(@contact_categories) do |contact_category|
  json.set! contact_category.name, [contact_category.contact1, contact_category.contact2]
end
