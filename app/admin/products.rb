ActiveAdmin.register Product do

  show do 
    h3 product.name
    div do
      product.designer
    end
    div do
      product.price
    end
    div do
      product.updated_at
    end
    div do 
      product.desc
    end
    div do
      product.status
    end
    product.pics.each do |pic|
      div do
        image_tag pic.photo.thumbnail.url
      end
    end
  end
end
