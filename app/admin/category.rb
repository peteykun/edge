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

  permit_params :name, :priority, :black_icon, :white_icon, :sponsor_id
  config.sort_order = 'id_asc'
  
  index do
    column :id
    column :name
    column :priority
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

    f.inputs 'Arrangement' do
      f.input :priority
    end

    f.inputs 'Icons' do
      f.input :black_icon, as: :file
      f.input :white_icon, as: :file
    end

    f.inputs "Sponsor" do
      @category = Category.find(params[:id])
      max_year = Sponsor.maximum(:year)
      where_clause = "year = " + max_year.to_s
      where_clause += " or id = " + @category.sponsor.id.to_s if @category.sponsor
      
      f.input :sponsor, collection: Hash[Sponsor.where(where_clause).map{|s| [s.year == max_year ? s.name : s.name + ' (' + s.year.to_s + ')', s.id]}]
    end

    f.actions
  end

end
