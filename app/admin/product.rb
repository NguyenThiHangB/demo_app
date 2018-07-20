ActiveAdmin.register Product do
  permit_params :name, :description, :image, :price, :year

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :image
    column :price
    column :year
    actions
  end

  filter :name
  filter :price

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :image
      f.input :price
      f.input :year
    end
    f.actions
  end
end
