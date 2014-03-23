json.sponsor_years do
  @sponsors.each do |year, sponsors|
    json.set! year, sponsors.each do |sponsor|
      json.extract! sponsor, :id, :name, :created_at, :updated_at, :url, :logo_content_type, :logo_file_size, :logo_updated_at, :year, :subtitle
      json.logo_url sponsor.logo.url
    end
  end
end
